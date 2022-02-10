import 'package:food_flutter_app/core/repository/popular_product_repo.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProduct();
    if (response.statusCode == 200) {
      _popularProductList.clear();
      _popularProductList.addAll();
      update();
    } else {}
  }
}
