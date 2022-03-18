import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../widgets/app_icon.dart';
import '../widgets/big_text.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color containerColor;

  const ProfileWidget({
    Key? key,
    required this.icon,
    required this.text,
    this.containerColor = AppColors.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 20.w,
        top: 20.h,
        bottom: 20.h,
        end: 20.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
      child: Row(
        children: [
          AppIcon(
            icon: icon,
            backgroundColor: containerColor,
            iconColor: Colors.white,
            iconSize: 25,
            containerSize: 50,
          ),
          SizedBox(width: 12.w),
          BigText(text: text)
        ],
      ),
    );
  }
}
