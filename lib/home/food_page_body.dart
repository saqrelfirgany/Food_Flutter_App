import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/helper/assets_helper.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:food_flutter_app/widgets/big_text.dart';
import 'package:food_flutter_app/widgets/icon_with_text.dart';
import 'package:food_flutter_app/widgets/small_text.dart';

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
    return Container(
      margin: EdgeInsetsDirectional.only(
        top: 14.h,
      ),
      // color: Colors.red,
      height: 320.h,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return buildPageItem(
              index: position, currentPageValue: _currentPageValue);
        },
      ),
    );
  }
}

Widget buildPageItem({required int index, required double currentPageValue}) {
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

  return Transform(
    transform: matrix,
    child: Stack(
      children: [
        Container(
          height: 220.h,
          margin: EdgeInsetsDirectional.only(
            start: 10.w,
            end: 10.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: index.isEven ? Colors.blue : Colors.deepOrange,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: assets['food0'],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120.h,
            margin: EdgeInsetsDirectional.only(
              start: 30.w,
              end: 30.w,
              bottom: 30.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: Colors.white,
            ),
            child: Container(
              padding: EdgeInsetsDirectional.only(
                top: 15.h,
                start: 25.w,
                end: 25.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: 'Chinese Side'),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
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
                      SmallText(text: '4.5'),
                      SizedBox(width: 10.w),
                      SmallText(text: '1293'),
                      SizedBox(width: 5.w),
                      SmallText(text: 'comments'),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      IconText(
                        icon: Icons.circle_sharp,
                        text: 'Normal',
                        iconColor: AppColors.iconColor1,
                      ),
                      IconText(
                        icon: Icons.location_on,
                        text: '1.7Km',
                        iconColor: AppColors.mainColor,
                      ),
                      IconText(
                        icon: Icons.access_time_rounded,
                        text: '32min',
                        iconColor: AppColors.iconColor2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
