import 'dart:convert';

import 'package:e_commerce/data/model/products_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {

  Future<Product> getRecommendedProductList() async {

    final String jsonString = await rootBundle.loadString(
      'assets/data/recommended_products.json',
    );

    final Map<String, dynamic> jsonData = jsonDecode(jsonString);

    return Product.fromJson(jsonData);
  }
}