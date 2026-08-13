import 'dart:convert';

import 'package:e_commerce/data/model/products_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {

  Future<Product> getPopularProductList() async {

    final String jsonString = await rootBundle.loadString(
      'assets/data/popular_products.json',
    );

    final Map<String, dynamic> jsonData = jsonDecode(jsonString);

    return Product.fromJson(jsonData);
  }
}