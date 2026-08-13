import 'package:e_commerce/data/repository/cart_repo.dart';
import 'package:get/get.dart';

import '../model/cart_model.dart';
import '../model/products_model.dart';

class CartController extends GetxController {

  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int,CartModel> _items = {};


  void addItem(ProductModel product , int quantity){

  }
}