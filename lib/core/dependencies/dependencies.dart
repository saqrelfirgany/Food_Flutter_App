import 'package:food_flutter_app/controllers/auth_controller.dart';
import 'package:food_flutter_app/controllers/cart_controller.dart';
import 'package:food_flutter_app/controllers/popular_product_controller.dart';
import 'package:food_flutter_app/controllers/recommended_controller.dart';
import 'package:food_flutter_app/core/api/api_client.dart';
import 'package:food_flutter_app/core/repository/cart_repo.dart';
import 'package:food_flutter_app/core/repository/popular_product_repo.dart';
import 'package:food_flutter_app/core/repository/recommended_repo.dart';
import 'package:food_flutter_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/auth_repo.dart';

Future<void> init() async {
  ///
  /// SharedPreferences
  ///
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences, fenix: true);

  ///
  /// API Client
  ///
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

  ///
  /// Repository
  ///
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(), fenix: true);
  Get.lazyPut(
        () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()),
    fenix: true,
  );

  ///
  /// Controller
  ///
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedController(recommendedRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()), fenix: true);
  Get.lazyPut(() =>AuthController(loginRepo: Get.find()), fenix: true);
}
