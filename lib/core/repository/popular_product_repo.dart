import 'package:food_flutter_app/core/api/api_client.dart';
import 'package:food_flutter_app/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProduct() async {
    return await apiClient.getData(uri: AppConstants.popularProductUri);
  }
}
