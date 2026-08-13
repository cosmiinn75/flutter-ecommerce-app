import 'package:e_commerce/data/controller/recommended_product_controller.dart';
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

   RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];

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
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(iconData: Icons.clear, backgroundColor: Colors.white)),
                AppIcon(iconData: Icons.shopping_cart, backgroundColor: Colors.white)
              ],
            ),
            bottom: PreferredSize(preferredSize: Size.fromHeight(20), child:
            Container(

              width: double.maxFinite,
              padding: EdgeInsets.only(top: Dimensions.calculateHeight(5), bottom: Dimensions.calculateHeight(10)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.calculateHeight(25)),
                      topRight: Radius.circular(Dimensions.calculateHeight(25))),
                color: Colors.white,),
              child: Center(child: BigText( text: product.name!, size: Dimensions.calculateHeight(25),)),
            )),
            pinned: true,
            expandedHeight: Dimensions.calculateHeight(300),
            backgroundColor: AppColors.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/image/${product.img!}", width: double.maxFinite, fit: BoxFit.cover,),
            ),

          ),
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.only(left: Dimensions.calculateWidth(20),right: Dimensions.calculateWidth(20)),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.calculateWidth(10),right: Dimensions.calculateWidth(10),bottom: Dimensions.calculateHeight(10)),
                    child: ExpandableTextWidget(text: product.description!),
                      ),
                  ],
                ))
            ,
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white70),
            padding: EdgeInsets.only(bottom: Dimensions.calculateHeight(10), top: Dimensions.calculateHeight(10), left: Dimensions.calculateWidth(50), right: Dimensions.calculateWidth(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(iconData: Icons.remove , backgroundColor: AppColors.mainColor,iconColor: Colors.white,iconSize: 24,),
                BigText(text: "\$${product.price!} " + " X " + " 0 ", size: 24, color: AppColors.mainBlackColor,),
                AppIcon(iconData: Icons.add , backgroundColor: AppColors.mainColor, iconColor: Colors.white, iconSize: 24)
              ],
            ),
          ),
          Container(
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
                  child: Icon(Icons.favorite , color: AppColors.mainColor,size: Dimensions.calculateHeight(24),)
                ),
                //Add to cart
                Container(
                  padding:  EdgeInsets.only(top:Dimensions.calculateHeight(15),bottom: Dimensions.calculateHeight(15),left: Dimensions.calculateWidth(15),right: Dimensions.calculateWidth(15)),
                  decoration: BoxDecoration(color: AppColors.mainColor ,
                      borderRadius: BorderRadius.circular(Dimensions.calculateHeight(20))),
                  child: BigText(text: "\$${product.price!} | Add to cart", color: Colors.white,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
