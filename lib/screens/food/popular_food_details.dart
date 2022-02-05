import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/helper/assets_helper.dart';
import 'package:food_flutter_app/widgets/app_icon.dart';

import '../components.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                child: buildSubHeaderDetails(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
