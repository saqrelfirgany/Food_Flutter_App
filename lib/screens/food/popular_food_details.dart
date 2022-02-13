import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/utils/assets_helper.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:food_flutter_app/widgets/app_icon.dart';
import 'package:food_flutter_app/widgets/big_text.dart';
import 'package:food_flutter_app/widgets/expandable_text.dart';

import '../components.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: bottomNavBarPopularFood(iconChild: bottomNavBarNegativeAddIcons()),
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
                    image: assets['food0'],
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
                children: const [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined),
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
                    buildSubHeaderDetails(text: 'Chinese Side'),
                    SizedBox(height: 24.h),
                    BigText(text: 'Introduce'),
                    SizedBox(height: 18.h),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(
                          text: 'When you get to know easy Chinese side dishes,'
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
                              'Everything seems to be simple at first glance until you taste them. I must '
                              'say that it will be an explosion and bursting with flavors in your mouth!',
                        ),
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
