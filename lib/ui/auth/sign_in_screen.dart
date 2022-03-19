import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../route/routes.dart';
import '../../utils/colors.dart';
import '../components.dart';
import '../widgets/big_text.dart';

class SignInScreen extends GetWidget<AuthController> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: GetBuilder<AuthController>(
            builder: (controller) => SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: controller.isReverse,
              child: Column(
                children: [
                  SizedBox(height: 24.h),

                  ///
                  /// App Logo
                  ///
                  appLogo(),
                  SizedBox(height: 20.h),

                  ///
                  /// Hello Title
                  ///
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    margin: EdgeInsetsDirectional.only(start: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BigText(
                          text: 'Hello',
                          fontWeight: FontWeight.bold,
                          size: 60,
                        ),
                        SizedBox(height: 10.h),
                        BigText(
                          text: 'Sign in to your Account',
                          size: 20,
                          color: Colors.grey[500]!,
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),

                  ///
                  /// Email Text Editing Field
                  ///
                  textForm(
                    textEditingController: controller.emailController,
                    hintText: 'Email',
                    iconData: Icons.email,
                    press: () => controller.toggleReverse(),
                  ),
                  SizedBox(height: 20.h),

                  ///
                  /// Password Text Editing Field
                  ///
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
                  SizedBox(height: 26.h),

                  ///
                  /// Sign In Stadium Button
                  ///
                  textFormContainer(
                    child: buttonStadiumBorder(
                      child: Center(
                        child: controller.isLoading
                            ? pleaseWaitButtonState()
                            : const Text('Sign In'),
                      ),
                      press: () {
                        FocusScope.of(context).unfocus();
                        controller.register();
                      },
                    ),
                  ),
                  SizedBox(height: 22.h),

                  ///
                  /// Have an account already
                  ///
                  InkWell(
                    onTap: () => Get.toNamed(Routes.signUpScreen),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(
                          text: 'Don`t Have an account? ',
                          size: 20,
                          color: Colors.grey[500]!,
                        ),
                        BigText(
                          text: 'Create',
                          size: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
