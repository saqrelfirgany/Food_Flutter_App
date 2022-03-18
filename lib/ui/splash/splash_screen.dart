import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_controller.dart';
import '../../route/routes.dart';
import '../../utils/assets_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  Future<void> _loadData() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedController>().getRecommendedProductList();
  }

  void _animationState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );
  }

  @override
  void initState() {
    super.initState();
    _loadData();
    _animationState();
    Timer(
      const Duration(seconds: 3),
      () => Get.offNamed(Routes.mainScreen),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ScaleTransition(
          scale: _animation,
          child: Center(
            child: Image.asset(
              assets['logo_part_1'],
              fit: BoxFit.cover,
              height: 120.h,
              width: 120.h,
            ),
          ),
        ),
      ),
    );
  }
}
