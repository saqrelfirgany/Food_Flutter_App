import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/helper/assets_helper.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:food_flutter_app/widgets/big_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        top: 14.h,
      ),
      color: Colors.red,
      height: 320.h,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return buildPageItem(position);
        },
      ),
    );
  }
}

Widget buildPageItem(int index) {
  return Stack(
    children: [
      Container(
        height: 220.h,
        margin: EdgeInsetsDirectional.only(
          start: 6.w,
          end: 6.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: index.isEven ? Colors.blue : Colors.deepOrange,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: assets['food0'],
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 140.h,
          margin: EdgeInsetsDirectional.only(
            start: 30.w,
            end: 30.w,
            bottom: 15.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: Colors.white,
          ),
          child: Container(
            padding: EdgeInsetsDirectional.only(
              top: 10.h,
              start: 15.w,
              end: 15.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: 'Chinese Side'),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          color: AppColors.mainColor,
                          size: 15.w,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
