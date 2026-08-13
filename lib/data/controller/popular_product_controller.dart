import 'dart:math';

import 'package:e_commerce/data/controller/cart_controller.dart';
import 'package:e_commerce/data/model/cart_model.dart';
import 'package:e_commerce/data/model/products_model.dart';
import 'package:e_commerce/data/repository/popular_product_repo.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {

  final PopularProductRepo popularProductRepo;
  late CartController _cart;

  PopularProductController({
    required this.popularProductRepo,
  });

  List<ProductModel> _popularProductList = [];

  List<ProductModel> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool  get isLoaded => _isLoaded;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  int _quantity = 0;

  int getQuantity() => _quantity;

  Future<void> getPopularProductList() async {
    Product product =
    await popularProductRepo.getPopularProductList();

    _popularProductList = [];

    _popularProductList.addAll(product.products);
    _isLoaded = true;
    update();
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = _inCartItems + _quantity < 20 ? _quantity + 1 : (() {
        Get.snackbar("Item count", "You can't add more", backgroundColor: AppColors.mainColor , colorText: Colors.white);

        return _quantity;
      }) ();
    } else {
      _quantity =_inCartItems + _quantity > 0 ? _quantity-1 : ( () {
        Get.snackbar("Item count", "You can't reduce more", backgroundColor: AppColors.mainColor , colorText: Colors.white);
        if(_inCartItems > 0){
          _quantity = -_inCartItems;
        }
        return _quantity;
      }) ();
    }
    update();
  }
  void initProduct(ProductModel product,CartController cart){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);


    if(exist){
      _inCartItems = _cart.getQuantity(product);
    }

  }

  void addItem(ProductModel product){


    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    update();
    }

    int get totalItems{
        return _cart.totalItems;
    }

    List<CartModel> get getItems{
        return _cart.getItems;
    }

  }

