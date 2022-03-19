import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/sign_up_model.dart';
import '../models/response_model.dart';
import '../repository/auth_repo.dart';
import '../route/routes.dart';
import '../ui/components.dart';

class AuthController extends GetxController {
  ///
  /// login Repo instance
  ///
  final AuthRepo loginRepo;

  AuthController({required this.loginRepo});

  ///
  /// Sign Up with Images
  ///
  final _signUpImages = [
    'g.png',
    't.png',
    'f.png',
  ];

  get signUpImages => _signUpImages;

  ///
  /// isLoading
  ///
  bool _isLoading = false;

  get isLoading => _isLoading;

  ///
  /// isVisible
  ///
  bool _isVisible = true;

  get isVisible => _isVisible;

  ///
  /// isReverse
  ///
  bool _isReverse = false;

  get isReverse => _isReverse;

  ///
  /// Text Editing Controllers
  ///
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController phoneController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  ///
  /// Toggle Reverse for Scroll View sign in & up
  ///
  void toggleReverse() {
    _isReverse = true;
    update();
  }

  ///
  /// Change Visibility for password form field
  ///
  void changeVisibility() {
    _isVisible = !_isVisible;
    update();
  }

  ///
  /// Form basic Validation
  ///
  bool validate() {
    if (emailController.text.isEmpty) {
      getSnackBar(title: 'Error', body: 'Enter your Email');
      return false;
    }
    if (passwordController.text.isEmpty) {
      getSnackBar(title: 'Error', body: 'Enter your password');
      return false;
    }
    if (nameController.text.isEmpty) {
      getSnackBar(title: 'Error', body: 'Enter your name');
      return false;
    }
    if (phoneController.text.isEmpty) {
      getSnackBar(title: 'Error', body: 'Enter your phone');
      return false;
    }
    return true;
  }

  ///
  /// Registration method
  ///
  void register() async {
    if (!validate()) return;

    _isLoading = true;
    update();

    final Response tokenResponse = await loginRepo.getServerToken();
    SignUpModel signUpModel = SignUpModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
    );
    final Response response =
        await loginRepo.getRegister(signUpModel: signUpModel);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      loginRepo.saveUserToken(token: response.body['request_token']);
      responseModel = ResponseModel(true, response.body['request_token']);
      Get.offAndToNamed(Routes.mainScreen);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
  }

  ///
  /// User LoggedIn bool method
  ///
  bool userLoggedIn() {
    return loginRepo.userLoggedIn();
  }
}
