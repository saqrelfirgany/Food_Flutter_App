import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_flutter_app/ui/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../route/routes.dart';
import '../../utils/colors.dart';
import '../components.dart';

class SignUpScreen extends GetWidget<AuthController> {
  const SignUpScreen({Key? key}) : super(key: key);

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
                  SizedBox(height: 20.h),

                  ///
                  /// Name Text Editing Field
                  ///
                  textForm(
                    textEditingController: controller.nameController,
                    hintText: 'Name',
                    iconData: Icons.person,
                    press: () {},
                  ),
                  SizedBox(height: 20.h),

                  ///
                  /// Phone Text Editing Field
                  ///
                  textForm(
                    textEditingController: controller.nameController,
                    hintText: 'Phone',
                    iconData: Icons.phone,
                    press: () {},
                  ),
                  SizedBox(height: 40.h),

                  ///
                  /// Sign In Stadium Button
                  ///
                  textFormContainer(
                    child: buttonStadiumBorder(
                      child: Center(
                        child: controller.isLoading
                            ? pleaseWaitButtonState()
                            : const Text('Sign Up'),
                      ),
                      press: () {
                        FocusScope.of(context).unfocus();
                        controller.register();
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),

                  ///
                  /// Have an account already
                  ///
                  InkWell(
                    onTap: () => Get.toNamed(Routes.signInScreen),
                    child: BigText(
                      text: 'Have an account already?',
                      color: Colors.grey[500]!,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  ///
                  /// Sign Up With
                  ///
                  BigText(
                    text: 'Sign Up With',
                    color: Colors.grey[500]!,
                    size: 20,
                  ),
                  SizedBox(height: 24.h),
                  Wrap(
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: EdgeInsetsDirectional.all(14.w),
                        child: CircleAvatar(
                          radius: 24.r,
                          backgroundImage: AssetImage(
                            'assets/image/${controller.signUpImages[index]}',
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
