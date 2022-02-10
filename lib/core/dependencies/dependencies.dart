import 'package:food_flutter_app/controllers/popular_product_controller.dart';
import 'package:food_flutter_app/core/api/api_client.dart';
import 'package:food_flutter_app/core/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  ///
  /// API Client
  ///
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://mvs.bslmeiyu.com"));

  ///
  /// Repository
  ///
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  ///
  /// Controller
  ///
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));

}
