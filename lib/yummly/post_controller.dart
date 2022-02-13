import 'dart:convert';
import 'package:food_flutter_app/yummly/service.dart';
import 'package:get/get.dart';

import 'post_model.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  var getPosts = PostModel().obs;
  Service service = Service();

  @override
  void onInit() {
    postMethod();
    super.onInit();
  }

  void postMethod() async {
    var result = await service.getAllPosts();
    if (result != null) {
      getPosts.value = result;
    } else {
      print('null from postMethod');
    }
  }
}
