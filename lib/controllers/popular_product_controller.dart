import 'package:food_flutter_app/core/repository/popular_product_repo.dart';
import 'package:food_flutter_app/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProduct();
    print('products');
    if (response.statusCode == 200) {
      print('got products');
      _popularProductList = [];
      print(Product.fromJson(response.body).toString());
      // _popularProductList.addAll(Product.fromJson(response.body).products);
      update();
    } else {}
  }
}
