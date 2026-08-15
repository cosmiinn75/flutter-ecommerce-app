import 'dart:convert';

import 'package:e_commerce/data/model/cart_model.dart';
import 'package:e_commerce/helper/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
    final SharedPreferences sharedPreferences;

    CartRepo({required this.sharedPreferences});


    List<String> cart = [];
    List<String> cartHistory = [];

    void addToCart(List<CartModel> cartList){

      // sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
      // sharedPreferences.remove(AppConstants.CART_LIST);

      var time = DateTime.now().toString();
      cart = [];
      cartList.forEach((e){
        e.time = time;
        cart.add(jsonEncode(e));
      });

      sharedPreferences.setStringList(AppConstants.CART_LIST, cart);

    }
    
    List<CartModel> getCartList(){
      List<CartModel> cartList = [];
      List<String> carts = [];
      if(sharedPreferences.containsKey(AppConstants.CART_LIST)) {
        carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      }
      
      carts.forEach((element) {
        cartList.add(CartModel.fromJson(jsonDecode(element)));
      });


      
      return cartList;
    }

    List<CartModel> getCartHistoryList(){

      if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
        cartHistory = [];
        cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
      }

      List<CartModel> cartHistoryList = [];
      cartHistory.forEach((e) => cartHistoryList.add(CartModel.fromJson(jsonDecode(e))));

      return cartHistoryList;
    }

    void addToCartHistoryList() {
      if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
        cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
      }

      for(int i = 0 ; i < cart.length ; i++){
          cartHistory.add(cart[i]);
      }
      clearCart();
      sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
    }




    void clearCart() {
      cart = [];
      sharedPreferences.remove(AppConstants.CART_LIST);
    }
}