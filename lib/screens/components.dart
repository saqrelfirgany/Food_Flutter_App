import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:food_flutter_app/widgets/big_text.dart';
import 'package:food_flutter_app/widgets/icon_with_text.dart';
import 'package:food_flutter_app/widgets/small_text.dart';

Widget buildSubHeaderDetails() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ///
      ///Sub Header Details - Food Name
      ///
      BigText(text: 'Chinese Side'),
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
