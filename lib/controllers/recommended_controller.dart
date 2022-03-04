import 'package:food_flutter_app/core/repository/recommended_repo.dart';
import 'package:food_flutter_app/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedController extends GetxController {
  final RecommendedRepo recommendedRepo;

  RecommendedController({required this.recommendedRepo});

  List<dynamic> _recommendedList = [];

  List<dynamic> get recommendedList => _recommendedList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getRecommendedProductList() async {
    _isLoading = true;
    Response response = await recommendedRepo.getRecommendedProduct();
    ///
    /// Check if the response is null or not
    ///
    if (response.statusCode == 200) {
      _recommendedList = [];
      _recommendedList.addAll(Product.fromJson(response.body).products);
      _isLoading = false;
      update();
    } else {}
  }
}
