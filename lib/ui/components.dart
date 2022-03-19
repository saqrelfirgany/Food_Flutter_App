import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/ui/widgets/app_icon.dart';
import 'package:food_flutter_app/ui/widgets/big_text.dart';
import 'package:food_flutter_app/ui/widgets/icon_with_text.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controllers/cart_controller.dart';
import '../controllers/popular_product_controller.dart';
import '../utils/assets_helper.dart';

Widget appLogo() {
  return Center(
    child: Image.asset(
      assets['logo_part_1'],
      fit: BoxFit.cover,
      height: 80.h,
      width: 80.h,
    ),
  );
}

Widget textFormContainer({required Widget child}) {
  return Container(
    margin: EdgeInsetsDirectional.only(
      start: 20.w,
      end: 20.w,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40.r),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          spreadRadius: 7,
          offset: Offset(1, 10),
          color: Colors.grey.withOpacity(0.2),
        ),
      ],
    ),
    child: child,
  );
}

void getSnackBar({required String title, required String body}) {
  Get.snackbar(
    title,
    body,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
  );
}

///
/// add and Remove Icons Bottom Navigation Bar Details screen
///
Widget addRemoveIcon({double margin = 10}) {
  return Container(
    height: 55.h,
    width: 90.w,
    margin: EdgeInsetsDirectional.only(
      start: margin.w,
      bottom: margin.h,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadiusDirectional.circular(14.r),
    ),
    child: GetBuilder<PopularProductController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => controller.setQuantity(false),
            child: Icon(
              Icons.remove,
              color: AppColors.signColor,
              size: 30.w,
            ),
          ),
          BigText(text: '${controller.inCartItem}'),
          GestureDetector(
            onTap: () => controller.setQuantity(true),
            child: Icon(
              Icons.add,
              color: AppColors.signColor,
              size: 30.w,
            ),
          ),
        ],
      ),
    ),
  );
}

///
/// Cart Icon
///
Widget cartIcon() {
  // Get.find<CartController>();
  return GetBuilder<PopularProductController>(
    builder: (controller) => InkWell(
      onTap: () => Get.toNamed('/cart-screen'),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const AppIcon(
            icon: Icons.shopping_cart_outlined,
            iconSize: 16,
          ),
          controller.totalItems >= 1
              ? PositionedDirectional(
                  end: -5.w,
                  bottom: -2.h,
                  child: const AppIcon(
                    icon: Icons.circle,
                    containerSize: 24,
                    iconColor: Colors.transparent,
                    backgroundColor: AppColors.mainColor,
                  ),
                )
              : Container(),
          controller.totalItems >= 1
              ? PositionedDirectional(
                  end: 0,
                  bottom: 0,
                  child: BigText(
                    text: controller.totalItems.toString(),
                    size: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Container(),
        ],
      ),
    ),
  );
}

Widget bottomNavBarPopularFood({
  required Widget iconChild,
  double iconChildWidth = 90,
}) {
  return Container(
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
          width: iconChildWidth.w,
          margin: EdgeInsetsDirectional.only(
            start: 10.w,
            bottom: 10.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(14.r),
          ),
          child: Icon(Icons.favorite, color: AppColors.mainColor),
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
              text: '\$10 | Add to Cart',
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget bottomNavBarNegativeAddIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        Icons.remove,
        color: AppColors.signColor,
        size: 30.w,
      ),
      BigText(text: '0'),
      Icon(
        Icons.add,
        color: AppColors.signColor,
        size: 30.w,
      ),
    ],
  );
}

Widget subHeaderHomePageContainer({required Widget detailsChild}) {
  return Align(
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
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFe8e8e8),
              blurRadius: 5.0,
              offset: Offset(0, 5),
            ),
            BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
            BoxShadow(color: Colors.white, offset: Offset(5, 0)),
          ]),
      child: Container(
        padding: EdgeInsetsDirectional.only(
          top: 15.h,
          start: 25.w,
          end: 25.w,
        ),

        ///
        ///Sub Header Details
        ///
        child: detailsChild,
      ),
    ),
  );
}

Widget buildSubHeaderDetailsRowIcons() {
  return Row(
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
  );
}