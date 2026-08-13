import 'package:e_commerce/data/controller/cart_controller.dart';
import 'package:e_commerce/data/controller/popular_product_controller.dart';
import 'package:e_commerce/pages/cart/cart_page.dart';
import 'package:e_commerce/pages/home/main_food_page.dart';
import 'package:e_commerce/route/route_helper.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:e_commerce/widget/expandable_text_widget.dart';
import 'package:e_commerce/widget/food_general_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../widget/app_icon.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail( {super.key , required this.pageId});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.calculateHeight(350),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/image/${product.img!}"),
                  fit: BoxFit.cover,
                  ),
                  )
                ),
          ),
          //Top buttons
          Positioned(
            top: Dimensions.calculateHeight(40),
            left: Dimensions.calculateWidth(20),
            right: Dimensions.calculateWidth(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(iconData: Icons.arrow_back_ios,size: 40,)),

              GetBuilder<PopularProductController>(builder: (controller){
                  return  Stack(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.to(() => CartPage());
                          },
                          child: AppIcon(iconData: Icons.shopping_cart_outlined,size: 40,)),
                        Get.find<PopularProductController>().totalItems > 0 ? 
                        Positioned(
                            right: 0,
                            top: 0,
                            child: AppIcon(iconData: Icons.circle,size: 20,iconColor: Colors.transparent , backgroundColor: AppColors.mainColor,))
                            : Container(),
                      Get.find<PopularProductController>().totalItems > 0 ?
                          Positioned(
                              right:4,
                              top: 2,
                              child: BigText(text: Get.find<PopularProductController>().totalItems.toString() , size: 12 , color: Colors.white,))
                          : Container(),
                    ],
                  );
              }
              )
              ]
          )),
          //General info about food container
          Positioned(
              left: 0,
              right: 0,
              top:Dimensions.calculateHeight(320),
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.calculateWidth(20),right: Dimensions.calculateWidth(20),top:Dimensions.calculateHeight(20)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.calculateHeight(20)),
                      topRight: Radius.circular(Dimensions.calculateHeight(20)),
                    ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoodGeneralInfo(foodName: product.name!,fontSize: 30,),
                    SizedBox(height: Dimensions.calculateHeight(10),),
                    BigText(text: "Introduce",size: 25,color: AppColors.mainBlackColor,),
                    SizedBox(height: Dimensions.calculateHeight(15),),
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: product.description!)))
                  ],
                ),
              )
          ),


        ],
        
      ),

      //Navigation bar
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
          margin: EdgeInsets.only(top: Dimensions.calculateHeight(10)),
          height: Dimensions.calculateHeight(120),
          padding: EdgeInsets.only(top: Dimensions.calculateHeight(30),bottom: Dimensions.calculateHeight(30),left: Dimensions.calculateWidth(20),right: Dimensions.calculateWidth(20)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.calculateHeight(40)),
                  topRight: Radius.circular(Dimensions.calculateHeight(40))
              ),
              color: AppColors.buttonBackgroundColor ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // - 0 +
              Container(
                padding:  EdgeInsets.only(top:Dimensions.calculateHeight(15),bottom: Dimensions.calculateHeight(15),left: Dimensions.calculateWidth(15),right: Dimensions.calculateWidth(15)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.calculateHeight(20)),color: Colors.white
                ),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap:() {
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove,color: AppColors.signColor)),
                    SizedBox(width: Dimensions.calculateWidth(10)),
                    BigText(text: "${popularProduct.inCartItems}"),
                    SizedBox(width: Dimensions.calculateWidth(10)),
                    GestureDetector(
                        onTap: () {
                            popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add,color: AppColors.signColor,))
                  ],
                ),
              ),
              //Add to cart
              GestureDetector(
                onTap: () {
                  popularProduct.addItem(product);
                },
                child: Container(
                  padding:  EdgeInsets.only(top:Dimensions.calculateHeight(15),bottom: Dimensions.calculateHeight(15),left: Dimensions.calculateWidth(15),right: Dimensions.calculateWidth(15)),
                  decoration: BoxDecoration(color: AppColors.mainColor ,
                      borderRadius: BorderRadius.circular(Dimensions.calculateHeight(20))),
                      child: BigText(text: "\$${product.price!} | Add to cart", color: Colors.white,),
                ),
              )
            ],
          ),
        );
      })
    );
  }
}
