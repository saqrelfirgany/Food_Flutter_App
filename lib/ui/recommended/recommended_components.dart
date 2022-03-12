import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/controllers/popular_product_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/colors.dart';
import '../widgets/app_icon.dart';
import '../widgets/big_text.dart';

Widget recommendedNavBar(product) {
  return GetBuilder<PopularProductController>(
    builder: (controller) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => controller.setQuantity(false),
              child: const AppIcon(
                icon: Icons.remove,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: 24,
              ),
            ),
            SizedBox(width: 24.w),
            BigText(
              text: '\$${product.price}  X ${controller.inCartItem}',
              color: AppColors.mainBlackColor,
              size: 26,
            ),
            SizedBox(width: 24.w),
            InkWell(
              onTap: () => controller.setQuantity(true),
              child: const AppIcon(
                icon: Icons.add,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: 24,
              ),
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
              InkWell(
                onTap: () => controller.addItem(product),
                child: Container(
                  height: 55.h,
                  width: 240.w,
                  margin: EdgeInsetsDirectional.only(
                    start: 10.w,
                    bottom: 10.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(18.r),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    child: BigText(
                      text: '\$${product.price} | Add to Cart',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
