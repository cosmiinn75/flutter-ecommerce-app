
import 'package:e_commerce/home/food_page_body.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:Dimensions.calculateHeight(45) , bottom: Dimensions.calculateHeight(15)),
            padding: EdgeInsets.only(left: Dimensions.calculateWidth(20),right: Dimensions.calculateWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children:[
                    BigText(text: "Bangladesh" , color: AppColors.mainColor),
                    Row
                      (
                      children: [
                        SmallText(text: "Bucharest", color: Colors.black54),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],

                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.calculateWidth(45),
                    height: Dimensions.calculateHeight(45),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.calculateHeight(15)),
                      color: AppColors.mainColor,
                    ),
                    child: Icon(Icons.search,color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          FoodPageBody(),
        ],

      ),
    );
  }
}
