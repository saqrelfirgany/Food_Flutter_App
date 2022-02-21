import 'package:food_flutter_app/controllers/popular_product_controller.dart';
import 'package:food_flutter_app/controllers/recommended_controller.dart';
import 'package:food_flutter_app/core/api/api_client.dart';
import 'package:food_flutter_app/core/repository/popular_product_repo.dart';
import 'package:food_flutter_app/core/repository/recommended_repo.dart';
import 'package:food_flutter_app/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  ///
  /// API Client
  ///
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

  ///
  /// Repository
  ///
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedRepo(apiClient: Get.find()));

  ///
  /// Controller
  ///
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedController(recommendedRepo: Get.find()));
  // Get.lazyPut(() => PostController());
  // Get.lazyPut(() => LoginController(), fenix: true);

}
