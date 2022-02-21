import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/controllers/popular_product_controller.dart';
import 'package:food_flutter_app/controllers/recommended_controller.dart';
import 'package:food_flutter_app/models/products_model.dart';
import 'package:food_flutter_app/screens/widgets/big_text.dart';
import 'package:food_flutter_app/screens/widgets/small_text.dart';
import 'package:food_flutter_app/utils/app_constants.dart';
import 'package:food_flutter_app/utils/assets_helper.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:get/get.dart';

import '../components.dart';
import 'recommended_food_list.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  double _currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///
        /// Slider Header Container - Popular Food
        ///
        GetBuilder<PopularProductController>(
          builder: (popularProducts) => Container(
            margin: EdgeInsetsDirectional.only(
              top: 14.h,
            ),
            // color: Colors.red,
            height: 320.h,
            child: popularProducts.isLoading
                ? const Center(
                    child:
                        CircularProgressIndicator(color: AppColors.mainColor),
                  )
                : PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.popularProductList.length,
                    itemBuilder: (context, position) {
                      return buildPageItem(
                        index: position,
                        currentPageValue: _currentPageValue,
                        popularProduct:
                            popularProducts.popularProductList[position],
                      );
                    },
                  ),
          ),
        ),
        buildDotsIndicator(currentPageValue: _currentPageValue),
        SizedBox(height: 30.h),
        recommendedTitle(),
        SizedBox(height: 10.h),
        const RecommendedFoodList(),
      ],
    );
  }
}

Widget buildDotsIndicator({required double currentPageValue}) {
  ///
  ///The DotsIndicator for the home page header
  ///
  return GetBuilder<PopularProductController>(
    builder: (popularProduct) => DotsIndicator(
      dotsCount: popularProduct.popularProductList.isEmpty
          ? 1
          : popularProduct.popularProductList.length,
      position: currentPageValue,
      decorator: DotsDecorator(
        activeColor: AppColors.mainColor,
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    ),
  );
}

Widget buildPageItem({
  required int index,
  required double currentPageValue,
  required ProductModel popularProduct,
}) {
  ///
  ///The PageItem for the home page header
  ///
  Matrix4 matrix = buildHeaderMatrix(index, currentPageValue);

  ///
  ///Header Slider for the home page header
  ///
  return Transform(
    transform: matrix,
    child: Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed('/popular-food?pageId=$index');
          },
          child: Container(
            height: 220.h,
            margin: EdgeInsetsDirectional.only(
              start: 10.w,
              end: 10.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: index.isEven ? Colors.blue : Colors.deepOrange,

              ///
              ///Header Slider Image for the home page header
              ///
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  AppConstants.uploadUri + popularProduct.img!,
                ),
              ),
            ),
          ),
        ),

        ///
        ///Sub Header Details - Container for the home page header
        ///
        subHeaderHomePageContainer(
          detailsChild: buildSubHeaderDetails(
            popularProduct: popularProduct,
          ),
        ),
      ],
    ),
  );
}

Widget buildSubHeaderDetails({required ProductModel popularProduct}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ///
      ///Sub Header Details - Food Name
      ///
      BigText(text: popularProduct.name!),
      SizedBox(height: 10.h),
      Row(
        children: [
          ///
          ///Sub Header Details - Food Starts
          ///
          Wrap(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                color: AppColors.mainColor,
                size: 15.w,
              ),
            ),
          ),
          SizedBox(width: 10.w),

          ///
          ///Sub Header Details - Food Starts rate
          ///
          SmallText(text: '4.5'),
          SizedBox(width: 10.w),

          ///
          ///Sub Header Details - Food num of comments
          ///
          SmallText(text: '1293'),
          SizedBox(width: 5.w),
          SmallText(text: 'comments'),
        ],
      ),
      SizedBox(height: 10.h),
      buildSubHeaderDetailsRowIcons()
    ],
  );
}

Matrix4 buildHeaderMatrix(int index, double currentPageValue) {
  ///
  ///The Matrix for transform the home page PageItem
  ///
  Matrix4 matrix = Matrix4.identity();
  double scaleFactor = 0.8;
  double height = 220.h;
  if (index == currentPageValue.floor()) {
    var currScale = 1 - (currentPageValue - index) * (1 - scaleFactor);
    var currTrans = height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  } else if (index == currentPageValue.floor() + 1) {
    var currScale =
        scaleFactor + (currentPageValue - index + 1) * (1 - scaleFactor);
    var currTrans = height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  } else if (index == currentPageValue.floor() - 1) {
    var currScale = 1 - (currentPageValue - index) * (1 - scaleFactor);
    var currTrans = height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  } else {
    var currScale = 0.8;
    var currTrans = height * (1 - scaleFactor) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  }
  return matrix;
}
