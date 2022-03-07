import 'package:flutter/material.dart';
import 'package:food_flutter_app/controllers/cart_controller.dart';
import 'package:food_flutter_app/core/repository/popular_product_repo.dart';
import 'package:food_flutter_app/models/products_model.dart';
import 'package:food_flutter_app/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  late CartController _cart;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  int _quantity = 0;

  int get quantity => _quantity;

  int _inCartItem = 0;

  int get inCartItem => _inCartItem + _quantity;

  Future<void> getPopularProductList() async {
    _isLoading = true;
    Response response = await popularProductRepo.getPopularProduct();

    ///
    /// Check if the response is null or not
    ///
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoading = false;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      if ((_inCartItem + _quantity) >= 20) {
        Get.snackbar("Item Count", "You can`t add more !");
        return;
      }
      _quantity += 1;
    } else {
      if ((_inCartItem + _quantity) <= 0) {
        Get.snackbar("Item Count", "You can`t reduce more !");
        return;
      }
      _quantity -= 1;
    }
    update();
  }

  void initProduct({
    required CartController cart,
    required ProductModel product,
  }) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItem = cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    if (quantity == 0) {
      Get.snackbar("Item Quantity", "You must add at least 1 item");
      return;
    }
    _cart.addItem(product, quantity);
    _quantity = 0;
    _inCartItem = _cart.getQuantity(product);
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }
}
