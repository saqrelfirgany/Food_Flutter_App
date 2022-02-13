import 'package:food_flutter_app/yummly/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Service {
  Future<PostModel?> getAllPosts() async {
    try {
      var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        print(response.body);
        var jsonResponse = convert.jsonDecode(response.body);
        return PostModel.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
