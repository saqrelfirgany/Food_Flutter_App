import 'package:food_flutter_app/controllers/auth_controller.dart';
import 'package:food_flutter_app/controllers/cart_controller.dart';
import 'package:food_flutter_app/controllers/popular_product_controller.dart';
import 'package:food_flutter_app/controllers/recommended_controller.dart';
import 'package:food_flutter_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';
import '../repository/auth_repo.dart';
import '../repository/cart_repo.dart';
import '../repository/popular_product_repo.dart';
import '../repository/recommended_repo.dart';

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

  /// Popular Product Repo
  Get.lazyPut(
    () => PopularProductRepo(apiClient: Get.find()),
  );

  ///Recommended Repo
  Get.lazyPut(
    () => RecommendedRepo(apiClient: Get.find()),
  );

  /// Cart Repo
  Get.lazyPut(
    () => CartRepo(),
  );

  /// Auth Repo
  Get.lazyPut(
    () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()),
    fenix: true,
  );

  ///
  /// Controllers
  ///

  /// Popular Product Controller
  Get.lazyPut(
    () => PopularProductController(popularProductRepo: Get.find()),
    fenix: true,
  );

  ///Recommended Controller
  Get.lazyPut(
    () => RecommendedController(recommendedRepo: Get.find()),
    fenix: true,
  );

  /// Cart Controller
  Get.lazyPut(
    () => CartController(cartRepo: Get.find()),
    fenix: true,
  );

  /// Auth Controller
  Get.lazyPut(
    () => AuthController(loginRepo: Get.find()),
    fenix: true,
  );
}
