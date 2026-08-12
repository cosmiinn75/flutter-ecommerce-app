import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:e_commerce/widget/food_general_info.dart';
import 'package:flutter/material.dart';

import '../../widget/app_icon.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

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
                  image: DecorationImage(image: AssetImage("assets/image/food1.jfif"),
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
                AppIcon(iconData: Icons.arrow_back_ios,size: 40,),
                AppIcon(iconData: Icons.shopping_cart,size: 40,)
              ]
          )),
          //Main content container
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
                    FoodGeneralInfo(foodName: "Steak with potatoes",fontSize: 30,),
                    SizedBox(height: Dimensions.calculateHeight(10),),
                    BigText(text: "Introduce",size: 25,color: AppColors.mainBlackColor,),
                    SizedBox(height: Dimensions.calculateHeight(15),),
                    
                  ],
                ),
              )),
        ],
        
      ),

      //Navigation bar
      bottomNavigationBar: Container(
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
            Container(
              padding:  EdgeInsets.only(top:Dimensions.calculateHeight(15),bottom: Dimensions.calculateHeight(15),left: Dimensions.calculateWidth(15),right: Dimensions.calculateWidth(15)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.calculateHeight(20)),color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove,color: AppColors.signColor),
                  SizedBox(width: Dimensions.calculateWidth(10)),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.calculateWidth(10)),
                  Icon(Icons.add,color: AppColors.signColor,)
                ],
              ),
            ),
            Container(
              padding:  EdgeInsets.only(top:Dimensions.calculateHeight(15),bottom: Dimensions.calculateHeight(15),left: Dimensions.calculateWidth(15),right: Dimensions.calculateWidth(15)),
              decoration: BoxDecoration(color: AppColors.mainColor , 
              borderRadius: BorderRadius.circular(Dimensions.calculateHeight(20))),
              child: BigText(text: "\$10 | Add to cart", color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
