import 'package:e_commerce/data/controller/cart_controller.dart';
import 'package:e_commerce/data/controller/popular_product_controller.dart';
import 'package:e_commerce/data/controller/recommended_product_controller.dart';
import 'package:e_commerce/data/repository/cart_repo.dart';
import 'package:e_commerce/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';

Future<void> init() async {
    Get.lazyPut(() => PopularProductRepo());
    Get.lazyPut(() => RecommendedProductRepo());
    Get.lazyPut(() => CartRepo());

    Get.lazyPut(
            () => PopularProductController(
            popularProductRepo: Get.find(),
        ),
    );

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