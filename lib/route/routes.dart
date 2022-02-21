import 'package:food_flutter_app/screens/food/popular_food_details.dart';
import 'package:food_flutter_app/screens/food/recommended_food_detail.dart';
import 'package:food_flutter_app/screens/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

List<GetPage> routes = [
  ///
  /// Main Screen
  ///
  GetPage(
    name: '/',
    page: () => const MainFoodPage(),
    // transition: Transition.noTransition,
    //Get.toNamed('/main-layout');
  ),

  /// -------------------------------------------------------------
  /*
  *
  */

  /// Popular Food Details Screen
  GetPage(
    name: '/popular-food',
    page: () {
      var index = Get.parameters['pageId'];
      return PopularFoodDetails(pageId: int.parse(index!));
    },
    transition: Transition.fadeIn,
  ),

  /// Recommended Food Details Screen
  GetPage(
    name: '/recommended-food-detail',
    page: () {
      var index = Get.parameters['pageId'];
      return RecommendedFoodDetail(pageId: int.parse(index!));
    },
    transition: Transition.fadeIn,
  ),
];
