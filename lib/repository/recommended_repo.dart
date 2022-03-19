import 'package:food_flutter_app/utils/app_constants.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class RecommendedRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedRepo({required this.apiClient});

  Future<Response> getRecommendedProduct() async {
    return await apiClient.getData(uri: AppConstants.popularProductUri);
  }
}
