import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/controllers/cart_controller.dart';
import 'package:food_flutter_app/ui/widgets/big_text.dart';
import 'package:food_flutter_app/ui/widgets/small_text.dart';
import 'package:food_flutter_app/utils/app_constants.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_controller.dart';
import '../../route/routes.dart';
import '../../utils/assets_helper.dart';
import '../components.dart';
import '../widgets/app_icon.dart';

class CartScreen extends GetWidget<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              GetBuilder<CartController>(
                builder: (controller) =>
                    BigText(text: '\$ ${controller.totalAmount}'),
              ),
              Container(
                height: 70.h,
                width: 200.w,
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
                      onTap: () {},
                      child: BigText(
                        text: 'Check out',
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
              top: 14.h,
              start: 14.w,
              end: 14.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: const AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      padding: 4,
                      backgroundColor: AppColors.mainColor,
                    ),
                  ),
                  SizedBox(width: 100.w),
                  InkWell(
                    onTap: () => Get.offAllNamed(Routes.mainScreen),
                    child: const AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      iconSize: 24,
                      backgroundColor: AppColors.mainColor,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed('/'),
                    child: const AppIcon(
                      icon: Icons.shopping_cart_outlined,
                      iconColor: Colors.white,
                      iconSize: 22,
                      backgroundColor: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              top: 70.h,
              start: 14.w,
              end: 14.w,
              bottom: 0,
              child: GetBuilder<CartController>(
                builder: (cartController) {
                  var _cartList = cartController.getItems;
                  return ListView.builder(
                    itemCount: _cartList.length,
                    itemBuilder: (context, index) => Container(
                      height: 140.h,
                      width: double.maxFinite,
                      margin: EdgeInsetsDirectional.only(bottom: 10.w),
                      //color: Colors.blue,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => cartController.navigateTo(
                                product: _cartList[index].product!),
                            child: Container(
                              height: 120.w,
                              width: 120.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    AppConstants.uploadUri +
                                        cartController.getItems[index].img!,
                                  ),
                                ),
                                borderRadius:
                                    BorderRadiusDirectional.circular(20.r),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: cartController.getItems[index].name!,
                                  color: Colors.black54,
                                ),
                                SmallText(text: 'Sub-title'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BigText(
                                      text:
                                          '\$ ${cartController.getItems[index].price!}',
                                      color: Colors.redAccent,
                                    ),
                                    Container(
                                      height: 55.h,
                                      width: 90.w,
                                      margin: EdgeInsetsDirectional.only(
                                        start: 0.w,
                                        bottom: 0.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                14.r),
                                      ),
                                      child:
                                          GetBuilder<PopularProductController>(
                                        builder: (controller) => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                cartController.addItem(
                                                  _cartList[index].product!,
                                                  -1,
                                                );
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: AppColors.signColor,
                                                size: 30.w,
                                              ),
                                            ),
                                            BigText(
                                                text:
                                                    '${_cartList[index].quantity}'),
                                            InkWell(
                                              onTap: () =>
                                                  cartController.addItem(
                                                _cartList[index].product!,
                                                1,
                                              ),
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
