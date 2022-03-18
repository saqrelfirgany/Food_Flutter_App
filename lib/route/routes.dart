import 'package:food_flutter_app/ui/cart/cart_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../ui/home/main_food_page.dart';
import '../ui/main_screen.dart';
import '../ui/popular/popular_food_details.dart';
import '../ui/recommended/recommended_food_detail.dart';
import '../ui/splash/splash_screen.dart';

class Routes {
  static const splash = '/';
  static const mainScreen = '/main-screen';
  static const detailScreen = '/detail-screen';
}

List<GetPage> routes = [
  ///
  /// Splash Screen
  ///
  GetPage(
    name: Routes.splash,
    page: () => const SplashScreen(),
    transition: Transition.fadeIn,
  ),

  ///
  /// Main Screen
  ///
  GetPage(
    name: Routes.mainScreen,
    page: () => const MainScreen(),
    transition: Transition.fadeIn,
  ),

  /// -------------------------------------------------------------
  /*
  *
  */

  /// Popular Food Details Screen
  GetPage(
    name: '/popular-popular',
    page: () {
      var index = Get.parameters['pageId'];
      return PopularFoodDetails(pageId: int.parse(index!));
    },
    transition: Transition.fadeIn,
  ),

  /// Recommended Food Details Screen
  GetPage(
    name: '/recommended-popular-detail',
    page: () {
      var index = Get.parameters['pageId'];
      return RecommendedFoodDetail(pageId: int.parse(index!));
    },
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/cart-screen',
    page: () => const CartScreen(),
    transition: Transition.fadeIn,
  ),
];
