import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../core/repository/auth_repo.dart';
import '../models/login_model.dart';
import '../models/response_model.dart';
import '../route/routes.dart';
import '../ui/components.dart';

class AuthController extends GetxController {
  final AuthRepo loginRepo;

  AuthController({required this.loginRepo});

  final _signUpImages = [
    'g.png',
    't.png',
    'f.png',
  ];

  get signUpImages => _signUpImages;

  bool _isLoading = false;

  get isLoading => _isLoading;

  bool _isVisible = true;

  get isVisible => _isVisible;

  bool _isReverse = false;

  get isReverse => _isReverse;

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

  void toggleReverse() {
    _isReverse = true;
    update();
  }

  void changeVisibility() {
    _isVisible = !_isVisible;
    update();
  }

  void signInSimulator() async {
    if (emailController.text.isEmpty) {
      getSnackBar(title: 'Error', body: 'Enter your user name');
      return;
    }
    if (passwordController.text.isEmpty) {
      getSnackBar(title: 'Error', body: 'Enter your password');
      return;
    }
    _isLoading = true;
    update();

    final Response tokenResponse = await loginRepo.getServerToken();
    LoginModel loginModel = LoginModel(
      name: emailController.text.trim(),
      password: passwordController.text.trim(),
      token: tokenResponse.body['request_token'],
    );
    final Response response =
        await loginRepo.getRegister(loginModel: loginModel);
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

  bool userLoggedIn() {
    return loginRepo.userLoggedIn();
  }
}
