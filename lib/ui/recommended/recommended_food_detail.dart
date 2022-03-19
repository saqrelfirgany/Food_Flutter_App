import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/controllers/recommended_controller.dart';
import 'package:food_flutter_app/route/routes.dart';
import 'package:food_flutter_app/ui/recommended/recommended_components.dart';
import 'package:food_flutter_app/utils/app_constants.dart';
import 'package:food_flutter_app/utils/assets_helper.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/popular_product_controller.dart';
import '../components.dart';
import '../widgets/app_icon.dart';
import '../widgets/big_text.dart';
import '../widgets/expandable_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;

  const RecommendedFoodDetail({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Get.find<RecommendedController>().recommendedList[pageId];
    Get.find<PopularProductController>().initProduct(
      cart: Get.find<CartController>(),
      product: product,
    );
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: recommendedNavBar(product),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 90.h,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.toNamed(Routes.mainScreen),
                  child: AppIcon(icon: Icons.clear, iconSize: 16),
                ),
                cartIcon(),
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
