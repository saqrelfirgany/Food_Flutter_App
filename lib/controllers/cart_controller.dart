import 'package:food_flutter_app/controllers/popular_product_controller.dart';
import 'package:food_flutter_app/controllers/recommended_controller.dart';
import 'package:food_flutter_app/core/repository/cart_repo.dart';
import 'package:food_flutter_app/models/cart_model.dart';
import 'package:food_flutter_app/models/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  void addItem(ProductModel product, int quantity) {
    print(quantity);
    var totalQuantity = 0;
    _items.forEach((key, value) {
      if (key == product.id) {
        totalQuantity = value.quantity!;
      }
    });
    if (totalQuantity <= 1) {
      _items.remove(product.id);
    }
    if (_items.containsKey(product.id!)) {
      _items.update(
        product.id!,
        (cart) => CartModel(
          id: cart.id,
          name: cart.name,
          price: cart.price,
          img: cart.img,
          quantity: cart.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toIso8601String(),
          product: product,
        ),
      );
      update();
      return;
    }
    if (quantity > 0) {
      _items.putIfAbsent(
        product.id!,
        () => CartModel(
          id: product.id,
          name: product.name,
          price: product.price,
          img: product.img,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toIso8601String(),
          product: product,
        ),
      );
    }
    update();
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems => _items.entries.map((e) => e.value).toList();

  void navigateTo({required ProductModel product}) {
    var popularIndex = Get.find<PopularProductController>()
        .popularProductList
        .indexOf(product);

    if (popularIndex >= 0) {
      Get.toNamed('/popular-popular?pageId=$popularIndex');
    } else {
      var recommendedIndex =
          Get.find<RecommendedController>().recommendedList.indexOf(product);
      Get.toNamed('/recommended-popular-detail?pageId=$recommendedIndex');
    }
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }
}
