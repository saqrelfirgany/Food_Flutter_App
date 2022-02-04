import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:food_flutter_app/widgets/big_text.dart';
import 'package:food_flutter_app/widgets/small_text.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Container(
                padding: EdgeInsetsDirectional.only(
                  top: 10.w,
                  start: 20.w,
                  end: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: 'Egypt', color: AppColors.mainColor),
                        // SizedBox(height: 4.w),
                        Row(
                          children: [
                            SmallText(text: 'Cairo', color: Colors.black54),
                            Icon(Icons.arrow_drop_down_rounded, size: 24.w)
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: 50.w,
                        height: 50.w,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
