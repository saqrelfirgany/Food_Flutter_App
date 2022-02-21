import 'package:food_flutter_app/core/api/api_client.dart';
import 'package:food_flutter_app/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedRepo({required this.apiClient});

  Future<Response> getRecommendedProduct() async {
    return await apiClient.getData(AppConstants.popularProductUri);
  }
}
