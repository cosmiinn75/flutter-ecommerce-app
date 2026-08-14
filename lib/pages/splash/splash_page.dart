import 'dart:async';

import 'package:e_commerce/route/route_helper.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/popular_product_controller.dart';
import '../../data/controller/recommended_product_controller.dart';
import '../../helper/dependencies.dart' as Dimension;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;


  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Dimension.init();

    _loadResource();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(
      Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getInitial())
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(child: Image.asset("assets/image/logo_part_1.png", width: Dimensions.calculateWidth(250)))),
          Center(child: Image.asset("assets/image/logo_part_2.png", width: Dimensions.calculateWidth(250))),
        ],
      ),
    );
  }
}
