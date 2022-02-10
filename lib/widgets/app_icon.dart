import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/utils/colors.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double containerSize;
  final double iconSize;

  const AppIcon({
    Key? key,
    required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.iconColor = const Color(0xFF756d45),
    this.containerSize = 45,
    this.iconSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerSize.w,
      width: containerSize.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(containerSize.r),
          color: backgroundColor),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize.w,
      ),
    );
  }
}
