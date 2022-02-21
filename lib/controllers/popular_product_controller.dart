import 'package:food_flutter_app/core/repository/popular_product_repo.dart';
import 'package:food_flutter_app/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  int _quantity = 0;

  int get quantity => _quantity;

  Future<void> getPopularProductList() async {
    _isLoading = true;
    Response response = await popularProductRepo.getPopularProduct();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoading = false;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity += 1;
    } else {
      if (_quantity == 0) return;
      _quantity -= 1;
    }
  }
}
