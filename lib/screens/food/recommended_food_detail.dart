import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/utils/assets_helper.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:food_flutter_app/widgets/app_icon.dart';
import 'package:food_flutter_app/widgets/big_text.dart';
import 'package:food_flutter_app/widgets/expandable_text.dart';

import '../components.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: buildBottomNavBarFoodDetails(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 90.h,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.clear),
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
                child: Center(child: BigText(text: 'Chinese Side', size: 26)),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: assets['food0'],
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
                child: const ExpandableText(
                  text: 'When you get to know easy Chinese side dishes,'
                      ' you will realize the shared feature among them is that they are so versatile'
                      ' to be served with every main course. In addition, they can be prepared quickly'
                      ' and consumed for light meals, lunches, or dinners.'
                      'To me, Chinese cuisine is so special, with ultimate'
                      ' cooking methods that turn simple ingredients into glorious dishes.'
                      'For example, to make the sauteed broccoli dish, the veggie needs to be poached before'
                      ' it is stir-fried with traditional seasonings. This creates the desired color, texture,'
                      ' and of course, flavors of the veggie.'
                      ' cooking methods that turn simple ingredients into glorious dishes.'
                      'For example, to make the sauteed broccoli dish, the veggie needs to be poached before'
                      ' it is stir-fried with traditional seasonings. This creates the desired color, texture,'
                      ' and of course, flavors of the veggie.'
                      'Chinese-styled sides do not require you to spend much time on'
                      ' the dishes’ appearance. Instead, savory flavors are the main focus.'
                      ' you will realize the shared feature among them is that they are so versatile'
                      ' to be served with every main course. In addition, they can be prepared quickly'
                      ' and consumed for light meals, lunches, or dinners.'
                      ' you will realize the shared feature among them is that they are so versatile'
                      ' to be served with every main course. In addition, they can be prepared quickly'
                      ' and consumed for light meals, lunches, or dinners.'
                      'To me, Chinese cuisine is so special, with ultimate'
                      ' cooking methods that turn simple ingredients into glorious dishes.'
                      'For example, to make the sauteed broccoli dish, the veggie needs to be poached before'
                      ' it is stir-fried with traditional seasonings. This creates the desired color, texture,'
                      ' and of course, flavors of the veggie.'
                      'Chinese-styled sides do not require you to spend much time on'
                      ' the dishes’ appearance. Instead, savory flavors are the main focus.'
                      ' you will realize the shared feature among them is that they are so versatile'
                      ' to be served with every main course. In addition, they can be prepared quickly'
                      ' and consumed for light meals, lunches, or dinners.'
                      ' you will realize the shared feature among them is that they are so versatile'
                      ' to be served with every main course. In addition, they can be prepared quickly'
                      ' and consumed for light meals, lunches, or dinners.'
                      'To me, Chinese cuisine is so special, with ultimate'
                      ' cooking methods that turn simple ingredients into glorious dishes.'
                      'For example, to make the sauteed broccoli dish, the veggie needs to be poached before'
                      ' it is stir-fried with traditional seasonings. This creates the desired color, texture,'
                      ' and of course, flavors of the veggie.'
                      'Chinese-styled sides do not require you to spend much time on'
                      ' the dishes’ appearance. Instead, savory flavors are the main focus.'
                      'To me, Chinese cuisine is so special, with ultimate'
                      ' cooking methods that turn simple ingredients into glorious dishes.'
                      'For example, to make the sauteed broccoli dish, the veggie needs to be poached before'
                      ' it is stir-fried with traditional seasonings. This creates the desired color, texture,'
                      ' and of course, flavors of the veggie.'
                      'Chinese-styled sides do not require you to spend much time on'
                      ' the dishes’ appearance. Instead, savory flavors are the main focus.'
                      'Everything seems to be simple at first glance until you taste them. I must '
                      'say that it will be an explosion and bursting with flavors in your mouth!',
                ),
              ),
            ],
          )),
        ],
      ),
    ));
  }

  Widget buildBottomNavBarFoodDetails() {
    return Column(
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
              text: '\$12.88 ' + ' X ' + '0',
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
        bottomNavBarPopularFood(
          iconChild: Icon(Icons.favorite, color: AppColors.mainColor),
          iconChildWidth: 60,
        ),
      ],
    );
  }
}
