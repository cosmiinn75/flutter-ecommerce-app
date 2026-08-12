import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class FoodGeneralInfo extends StatelessWidget {

  final String foodName;
  final double fontSize;

  const FoodGeneralInfo({super.key, required this.foodName, this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: foodName,size: fontSize,),
        SizedBox(height: Dimensions.calculateHeight(10)),
        Row(
          //Stars and comments
          children: [
            Wrap
              (
                children: List.generate
                  (5,(index) => Icon(Icons.star,color: AppColors.mainColor,size:Dimensions.calculateHeight(15))
                )
            ),
            SizedBox(width: Dimensions.calculateHeight(10)),
            SmallText(text: "4.5"),
            SizedBox(width:  Dimensions.calculateHeight(10)),
            SmallText(text: "1286"),
            SizedBox(width:  Dimensions.calculateHeight(10)),
            SmallText(text: "comments")
          ],
        ),
        SizedBox(height: Dimensions.calculateHeight(20)),
        //Information about food
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(icon: Icons.circle_sharp, text: "Normal", iconColor: AppColors.iconColor1),

            IconAndTextWidget(icon: Icons.location_on, text: "1.7km", iconColor: AppColors.mainColor),

            IconAndTextWidget(icon: Icons.access_time_rounded, text: "32min", iconColor:AppColors.iconColor2)
          ],
        )
      ],
    );
  }
}
