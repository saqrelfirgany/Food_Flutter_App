import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/utils/colors.dart';

class SmallText extends StatelessWidget {
  Color color;
  String text;
  double size;
  double height;
  bool overFlow;

  SmallText({
    Key? key,
    this.color = AppColors.textColor,
    required this.text,
    this.height = 1.2,
    this.size = 14,
    this.overFlow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow ? TextOverflow.ellipsis : TextOverflow.visible,
      style: TextStyle(
        height: height,
        color: color,
        fontFamily: 'Roboto',
        fontSize: size.sp,
      ),
    );
  }
}
