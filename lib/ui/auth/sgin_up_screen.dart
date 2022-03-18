import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controllers/auth_controller.dart';
import '../../utils/assets_helper.dart';
import '../../utils/colors.dart';
import '../components.dart';
import 'auth_components.dart';

class SignUpScreen extends GetWidget<AuthController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height: 24.h),
              Center(
                child: Image.asset(
                  assets['logo_part_1'],
                  fit: BoxFit.cover,
                  height: 120.h,
                  width: 120.h,
                ),
              ),
              SizedBox(height: 40.h),
              GetBuilder<AuthController>(
                builder: (controller) => Expanded(
                  child: SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    reverse: controller.isReverse,
                    child: Column(
                      children: [
                        textFormContainer(
                          child: TextField(
                            controller: controller.userNameController,
                            // onTap: () => controller.toggleReverse(),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsetsDirectional.all(24.w),
                              hintText: 'User Name',
                              hintStyle: TextStyle(fontSize: 20.sp),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: AppColors.yellowColor,
                              ),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        textFormContainer(
                          child: TextField(
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsetsDirectional.all(24.w),
                              hintText: 'Password',
                              hintStyle: TextStyle(fontSize: 20.sp),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: AppColors.yellowColor,
                              ),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              suffixIcon: visibility(),
                            ),
                            obscureText: controller.isVisible,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        textFormContainer(
                          child: buttonStadiumBorder(
                            child: Center(
                              child: controller.isLoading
                                  ? pleaseWaitButtonState()
                                  : const Text('Sign In'),
                            ),
                            press: () {
                              FocusScope.of(context).unfocus();
                              controller.signInSimulator();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}