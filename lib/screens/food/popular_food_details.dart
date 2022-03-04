import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/controllers/cart_controller.dart';
import 'package:food_flutter_app/controllers/popular_product_controller.dart';
import 'package:food_flutter_app/screens/home/food_page_body.dart';
import 'package:food_flutter_app/screens/widgets/app_icon.dart';
import 'package:food_flutter_app/screens/widgets/big_text.dart';
import 'package:food_flutter_app/screens/widgets/expandable_text.dart';
import 'package:food_flutter_app/utils/app_constants.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:get/get.dart';

import '../components.dart';

class PopularFoodDetails extends StatelessWidget {
  final int pageId;

  const PopularFoodDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(
      cart: Get.find<CartController>(),
      product: product,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
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
                width: 90.w,
                margin: EdgeInsetsDirectional.only(
                  start: 10.w,
                  bottom: 10.h,
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
                  child: GetBuilder<PopularProductController>(
                    builder: (controller) => InkWell(
                      onTap: () => controller.addItem(product),
                      child: BigText(
                        text: '\$${product.price} | Add to Cart',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            PositionedDirectional(
              start: 0,
              end: 0,
              child: Container(
                width: double.infinity,
                height: 350.h,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.uploadUri + product.img!),
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              start: 15.w,
              top: 15.w,
              end: 15.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.toNamed('/'),
                    child: const AppIcon(icon: Icons.arrow_back_ios),
                  ),
                  const AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              ),
            ),
            PositionedDirectional(
              start: 0,
              end: 0,
              top: 320.h,
              bottom: 0,
              child: Container(
                // width: 200.w,
                height: 200.h,
                padding: EdgeInsetsDirectional.all(20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20.r),
                    topEnd: Radius.circular(20.r),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSubHeaderDetails(popularProduct: product),
                    SizedBox(height: 24.h),
                    BigText(text: 'Introduce'),
                    SizedBox(height: 18.h),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(text: product.description!),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
