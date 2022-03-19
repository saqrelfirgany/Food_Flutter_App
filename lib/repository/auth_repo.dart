import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../models/sign_up_model.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class AuthRepo extends GetxService {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(AppConstants.token) ?? 'none';
  }

  Future<Response> getServerToken() async {
    return await apiClient.getData(uri: AppConstants.tokenUri);
  }

  Future<Response> getRegister({required SignUpModel signUpModel}) async {
    return await apiClient.postData(
      uri: AppConstants.registerUri,
      body: signUpModel.toJson(),
    );
  }

  Future<bool> saveUserToken({required String token}) async {
    apiClient.token = token;
    apiClient.updateHeader(token: token);
    return await sharedPreferences.setString('token', token);
  }
}
