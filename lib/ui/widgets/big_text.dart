import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/utils/colors.dart';

class BigText extends StatelessWidget {
  Color color;
  String text;
  double size;
  TextOverflow textOverflow;
  FontWeight fontWeight;

  BigText({
    Key? key,
    this.color = AppColors.mainBlackColor,
    required this.text,
    this.textOverflow = TextOverflow.ellipsis,
    this.size = 24,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontFamily: 'Roboto',
        fontSize: size.sp,
      ),
    );
  }
}
