import 'package:e_commerce/data/controller/cart_controller.dart';
import 'package:e_commerce/data/controller/popular_product_controller.dart';
import 'package:e_commerce/data/controller/recommended_product_controller.dart';
import 'package:e_commerce/pages/cart/cart_page.dart';
import 'package:e_commerce/route/route_helper.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/app_icon.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:e_commerce/widget/expandable_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  final String page;

  RecommendedFoodDetail({super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(
      product,
      Get.find<CartController>(),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.calculateHeight(70),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if(page == "cartpage"){
                      Get.toNamed(RouteHelper.cartPage);
                    }
                    else {
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                  child: AppIcon(
                    iconData: Icons.clear,
                    backgroundColor: Colors.white,
                  ),
                ),

                GetBuilder<PopularProductController>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getCartPage());
                      },
                      child: Stack(
                        children: [
                        AppIcon(
                              iconData: Icons.shopping_cart_outlined,
                              size: 40,
                            ),

                          controller.totalItems > 0
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    iconData: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                )
                              : Container(),
                          controller.totalItems > 0
                              ? Positioned(
                                  right: 4,
                                  top: 2,
                                  child: BigText(
                                    text: controller
                                        .totalItems
                                        .toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  top: Dimensions.calculateHeight(5),
                  bottom: Dimensions.calculateHeight(10),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.calculateHeight(25)),
                    topRight: Radius.circular(Dimensions.calculateHeight(25)),
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: BigText(
                    text: product.name!,
                    size: Dimensions.calculateHeight(25),
                  ),
                ),
              ),
            ),
            pinned: true,
            expandedHeight: Dimensions.calculateHeight(300),
            backgroundColor: AppColors.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/${product.img!}",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                left: Dimensions.calculateWidth(20),
                right: Dimensions.calculateWidth(20),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.calculateWidth(10),
                      right: Dimensions.calculateWidth(10),
                      bottom: Dimensions.calculateHeight(10),
                    ),
                    child: ExpandableTextWidget(text: product.description!),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white70),
                padding: EdgeInsets.only(
                  bottom: Dimensions.calculateHeight(10),
                  top: Dimensions.calculateHeight(10),
                  left: Dimensions.calculateWidth(50),
                  right: Dimensions.calculateWidth(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        iconData: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: 24,
                      ),
                    ),
                    BigText(
                      text: "\$${product.price!} X ${controller.inCartItems}",
                      size: 24,
                      color: AppColors.mainBlackColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        iconData: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                        size: Dimensions.calculateHeight(24),
                      ),
                    ),
                    //Add to cart
                    GestureDetector(
                      onTap: () {
                        controller.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: Dimensions.calculateHeight(15),
                          bottom: Dimensions.calculateHeight(15),
                          left: Dimensions.calculateWidth(15),
                          right: Dimensions.calculateWidth(15),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(
                            Dimensions.calculateHeight(20),
                          ),
                        ),
                        child: BigText(
                          text: "\$${product.price!} | Add to cart",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
