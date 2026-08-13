import 'package:e_commerce/data/model/products_model.dart';
import 'package:get/get.dart';

import '../repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {

  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({
    required this.recommendedProductRepo,
  });

  List<ProductModel> _recommendedProductList = [];

  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool  get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Product product =
    await recommendedProductRepo.getRecommendedProductList();

    _recommendedProductList= [];

    _recommendedProductList.addAll(product.products);
    _isLoaded = true;
    update();
  }
}