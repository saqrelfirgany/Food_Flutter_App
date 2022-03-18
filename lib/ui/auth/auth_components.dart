import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../theme/theme.dart';
import '../../utils/colors.dart';

Widget visibility() {
  return GetBuilder<AuthController>(
    builder: (controller) => controller.isVisible
        ? iconVisible(
      press: () => controller.changeVisibility(),
      icon: Icons.visibility_off,
    )
        : iconVisible(
      press: () => controller.changeVisibility(),
      icon: Icons.visibility,
    ),
  );
}

Widget iconVisible({
  required VoidCallback press,
  required IconData icon,
}) {
  return InkWell(
    onTap: press,
    child: Icon(icon, color: AppColors.yellowColor),
  );
}

Widget buttonStadiumBorder({
  required Widget child,
  required VoidCallback press,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(60.h),
      onPrimary: Colors.white,
      primary: primaryColor,
      textStyle: TextStyle(fontSize: 20.sp),
      shape: const StadiumBorder(),
    ),
    onPressed: press,
    child: child,
  );
}

Widget pleaseWaitButtonState() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40.w,
          height: 40.w,
          child: const CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 10.w),
        Text('please-wait...'.tr),
      ],
    ),
  );
}