import 'package:e_commerce/data/controller/cart_controller.dart';
import 'package:e_commerce/data/controller/popular_product_controller.dart';
import 'package:e_commerce/data/controller/recommended_product_controller.dart';
import 'package:e_commerce/route/route_helper.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/app_icon.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.calculateWidth(20),
            right: Dimensions.calculateHeight(20),
            top: Dimensions.calculateHeight(60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AppIcon(
                    iconData: Icons.arrow_back_ios,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    size: 40,
                  ),
                ),
                SizedBox(width: Dimensions.calculateWidth(100)),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    iconData: Icons.home_outlined,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    size: 40,
                  ),
                ),
                AppIcon(
                  iconData: Icons.shopping_cart_outlined,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  size: 40,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.calculateHeight(100),
            left: Dimensions.calculateWidth(20),
            right: Dimensions.calculateWidth(20),
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.calculateHeight(15)),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (_, index) {
                        var cartProduct = _cartList[index].product!;
                        return Container(
                          height: 100,
                          width: double.maxFinite,
                          margin: EdgeInsets.only(
                            bottom: Dimensions.calculateHeight(10),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (cartProduct.typeId! == 1) {
                                    final recommendedController =
                                        Get.find<
                                          RecommendedProductController
                                        >();
                                    int index = recommendedController
                                        .recommendedProductList
                                        .indexWhere(
                                          (product) =>
                                              cartProduct.id == product.id,
                                        );
                                    Get.toNamed(
                                      RouteHelper.getRecommendedFood(
                                        index,
                                        "cartpage",
                                      ),
                                    );
                                  } else {
                                    final popularController =
                                        Get.find<PopularProductController>();
                                    int index = popularController
                                        .popularProductList
                                        .indexWhere(
                                          (product) =>
                                              cartProduct.id == product.id,
                                        );
                                    Get.toNamed(
                                      RouteHelper.getPopularFood(
                                        index,
                                        "cartpage",
                                      ),
                                    );
                                  }
                                },

                                child: Container(
                                  width: Dimensions.calculateWidth(100),
                                  height: Dimensions.calculateHeight(100),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/image/${_cartList[index].img!}",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.calculateHeight(20),
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimensions.calculateWidth(10)),
                              Expanded(
                                child: Container(
                                  height: Dimensions.calculateHeight(100),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                        text: cartController
                                            .getItems[index]
                                            .name!,
                                        color: Colors.black54,
                                      ),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text:
                                                "\$ ${cartController.getItems[index].price!}",
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: Dimensions.calculateHeight(
                                                15,
                                              ),
                                              bottom:
                                                  Dimensions.calculateHeight(
                                                    15,
                                                  ),
                                              left: Dimensions.calculateWidth(
                                                15,
                                              ),
                                              right: Dimensions.calculateWidth(
                                                15,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    Dimensions.calculateHeight(
                                                      20,
                                                    ),
                                                  ),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                      _cartList[index].product!,
                                                      -1,
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      Dimensions.calculateWidth(
                                                        10,
                                                      ),
                                                ),
                                                BigText(
                                                  text: _cartList[index]
                                                      .quantity
                                                      .toString(),
                                                ),
                                                SizedBox(
                                                  width:
                                                      Dimensions.calculateWidth(
                                                        10,
                                                      ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                      _cartList[index].product!,
                                                      1,
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            margin: EdgeInsets.only(top: Dimensions.calculateHeight(10)),
            height: Dimensions.calculateHeight(120),
            padding: EdgeInsets.only(
              top: Dimensions.calculateHeight(30),
              bottom: Dimensions.calculateHeight(30),
              left: Dimensions.calculateWidth(20),
              right: Dimensions.calculateWidth(20),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.calculateHeight(40)),
                topRight: Radius.circular(Dimensions.calculateHeight(40)),
              ),
              color: AppColors.buttonBackgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // - 0 +
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.calculateHeight(15),
                    bottom: Dimensions.calculateHeight(15),
                    left: Dimensions.calculateWidth(15),
                    right: Dimensions.calculateWidth(15),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.calculateHeight(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [

                      SizedBox(width: Dimensions.calculateWidth(10)),
                      BigText(text: "\$${cartController.totalAmount}"),
                      SizedBox(width: Dimensions.calculateWidth(10)),

                    ],
                  ),
                ),
                //Add to cart
                GestureDetector(
                  onTap: () {

                  cartController.addToHistoryList();
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.calculateHeight(15),
                      bottom: Dimensions.calculateHeight(15),
                      left: Dimensions.calculateWidth(25),
                      right: Dimensions.calculateWidth(25),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(
                        Dimensions.calculateHeight(20),
                      ),
                    ),
                    child: BigText(
                      text: "Checkout",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
