import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:food_flutter_app/widgets/big_text.dart';
import 'package:food_flutter_app/widgets/icon_with_text.dart';
import 'package:food_flutter_app/widgets/small_text.dart';

Widget buildBottomNavigationBar() {
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
          width: 90.w,
          margin: EdgeInsetsDirectional.only(
            start: 10.w,
            bottom: 10.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(14.r),
          ),
          child: Row(
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

Widget buildSubHeaderDetails({required String text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ///
      ///Sub Header Details - Food Name
      ///
      BigText(text: text),
      SizedBox(height: 10.h),
      Row(
        children: [
          ///
          ///Sub Header Details - Food Starts
          ///
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
          SizedBox(width: 10.w),

          ///
          ///Sub Header Details - Food Starts rate
          ///
          SmallText(text: '4.5'),
          SizedBox(width: 10.w),

          ///
          ///Sub Header Details - Food num of comments
          ///
          SmallText(text: '1293'),
          SizedBox(width: 5.w),
          SmallText(text: 'comments'),
        ],
      ),
      SizedBox(height: 10.h),
      buildSubHeaderDetailsRowIcons()
    ],
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
