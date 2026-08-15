import 'package:e_commerce/data/controller/cart_controller.dart';
import 'package:e_commerce/data/controller/popular_product_controller.dart';
import 'package:e_commerce/data/controller/recommended_product_controller.dart';
import 'package:e_commerce/pages/auth/sign_up_page.dart';
import 'package:e_commerce/pages/cart/cart_page.dart';
import 'package:e_commerce/pages/food/recommended_food_detail.dart';
import 'package:e_commerce/pages/home/food_page_body.dart';
import 'package:e_commerce/pages/home/main_food_page.dart';
import 'package:e_commerce/pages/splash/splash_page.dart';
import 'package:e_commerce/route/route_helper.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'data/repository/cart_repo.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  Get.find<CartController>().getCartData();
  // Get.find<CartRepo>().clearCart();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);


    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {


        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: SignUpPage(),
          // initialRoute: RouteHelper.getSplash(),
          // getPages: RouteHelper.routes,
        );
      });
    });
  }
}

