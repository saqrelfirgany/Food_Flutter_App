import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/controllers/recommended_controller.dart';
import 'package:food_flutter_app/screens/widgets/app_icon.dart';
import 'package:food_flutter_app/screens/widgets/big_text.dart';
import 'package:food_flutter_app/screens/widgets/expandable_text.dart';
import 'package:food_flutter_app/utils/app_constants.dart';
import 'package:food_flutter_app/utils/assets_helper.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../components.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;

  const RecommendedFoodDetail({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Get.find<RecommendedController>().recommendedList[pageId];

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcon(
                icon: Icons.remove,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: 24,
              ),
              SizedBox(width: 24.w),
              BigText(
                text: '\$${product.price}  X 0',
                color: AppColors.mainBlackColor,
                size: 26,
              ),
              SizedBox(width: 24.w),
              AppIcon(
                icon: Icons.add,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: 24,
              ),
            ],
          ),
          Container(
            height: 100.h,
            padding: EdgeInsetsDirectional.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(35.r),
                topEnd: Radius.circular(35.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 55.h,
                  // width: iconChildWidth.w,
                  width: 60.w,
                  margin: EdgeInsetsDirectional.only(
                    start: 10.w,
                    bottom: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(14.r),
                  ),
                  child: const Icon(Icons.favorite, color: AppColors.mainColor),
                ),
                Container(
                  height: 55.h,
                  width: 240.w,
                  margin: EdgeInsetsDirectional.only(
                    start: 10.w,
                    bottom: 10.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(20.r),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    child: BigText(
                      text: '\$${product.price} | Add to Cart',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 90.h,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.offAndToNamed('/'),
                  child: AppIcon(icon: Icons.clear),
                ),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.h),
              child: Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.all(10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20.r),
                    topEnd: Radius.circular(20.r),
                  ),
                ),
                child: Center(
                  child: BigText(text: product.name, size: 26),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: NetworkImage(AppConstants.uploadUri + product.img),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.all(10.w),
                child: ExpandableText(text: product.description),
              ),
            ],
          )),
        ],
      ),
    ));
  }
}
