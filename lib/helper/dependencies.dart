import 'package:e_commerce/data/controller/auth_controller.dart';
import 'package:e_commerce/data/controller/cart_controller.dart';
import 'package:e_commerce/data/controller/popular_product_controller.dart';
import 'package:e_commerce/data/controller/recommended_product_controller.dart';
import 'package:e_commerce/data/controller/user_controller.dart';
import 'package:e_commerce/data/repository/auth_repo.dart';
import 'package:e_commerce/data/repository/cart_repo.dart';
import 'package:e_commerce/data/repository/popular_product_repo.dart';
import 'package:e_commerce/data/repository/user_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/recommended_product_repo.dart';




Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();


    Get.lazyPut(() => sharedPreferences);

    Get.lazyPut(() => PopularProductRepo());
    Get.lazyPut(() => RecommendedProductRepo());
    Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
    Get.lazyPut(() => AuthRepo(sharedPreferences: Get.find()));
    Get.lazyPut(()=> UserRepo());

    Get.lazyPut(
            () => PopularProductController(
            popularProductRepo: Get.find(),
        ),
    );

    Get.lazyPut(() => AuthController(authRepo: Get.find()));
    Get.lazyPut(()=> UserController(userRepo: Get.find()));

    Get.lazyPut(
          () => RecommendedProductController(
        recommendedProductRepo: Get.find(),
      ),
    );
    Get.lazyPut(
          () => CartController(
        cartRepo: Get.find(),
      ),
    );
}