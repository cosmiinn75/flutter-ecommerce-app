import 'dart:convert';

import 'package:e_commerce/data/model/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
    final SharedPreferences sharedPreferences;

    CartRepo({required this.sharedPreferences});

    List<String> cart = [];

    void addToCart(List<CartModel> cartList){

      cart = [];
      cartList.forEach((e){
        cart.add(jsonEncode(e));
      });

      sharedPreferences.setStringList("Cart-list", cart);

    }
}