import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/data/controller/popular_product_controller.dart';
import 'package:e_commerce/data/controller/recommended_product_controller.dart';
import 'package:e_commerce/data/model/products_model.dart';
import 'package:e_commerce/pages/food/popular_food_detail.dart';
import 'package:e_commerce/route/route_helper.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:e_commerce/widget/food_general_info.dart';
import 'package:e_commerce/widget/icon_and_text_widget.dart';
import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;


  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
          setState(() {
            _currentPageValue = pageController.page!;
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider sections
      GetBuilder<PopularProductController>(builder: (popularProducts) {
        return popularProducts.isLoaded ?  SizedBox(
          height: Dimensions.calculateHeight(320),
            child: PageView.builder
              (
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context,position) {
                  return _buildPageItem(position , popularProducts.popularProductList[position]);
                }
            ),
        ) : CircularProgressIndicator(
          color: AppColors.mainColor,
        );
      }),
      //Dots
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return  DotsIndicator(
            dotsCount:popularProducts.popularProductList.length <= 0 ? 1: popularProducts.popularProductList.length ,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.calculateHeight(5))),
            ),
          );
        }),
      SizedBox(height: Dimensions.calculateHeight(30)),
        //Popular text
      Container(
        margin: EdgeInsets.only(left: Dimensions.calculateWidth(30)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BigText(text: "Recommended"),
            SizedBox(width: Dimensions.calculateWidth(10),),
            Container(
              margin: const EdgeInsets.only(bottom: 3),
              child: BigText(text: ".", color: Colors.black26,),
            ),
            SizedBox(width: Dimensions.calculateWidth(10),),
            Container(
              margin: const EdgeInsets.only(bottom: 6),
                child: SmallText(text: "Food pairing")
            ),
          ],
        ),
      ),
        //List of recommended items
      GetBuilder<RecommendedProductController>(builder: (recommendedProducts) {
        return recommendedProducts.isLoaded ? SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recommendedProducts.recommendedProductList.length,
              itemBuilder: (context,index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getRecommendedFood(index));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: Dimensions.calculateWidth(20),right: Dimensions.calculateWidth(20),bottom: Dimensions.calculateHeight(10)),
                    //Each item
                    child: Row(
                      children: [
                        // Image section
                        Container(
                          width:Dimensions.calculateWidth(120),
                          height: Dimensions.calculateHeight(120),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.calculateHeight(30)),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/image/${recommendedProducts.recommendedProductList[index].img!}"),
                                fit: BoxFit.cover),
                          ),


                        ),
                        //Text container
                        Expanded(
                          //Text background
                          child: Container(
                            height: Dimensions.calculateHeight(100),
                            decoration: BoxDecoration(
                                borderRadius:BorderRadius.only(topRight: Radius.circular(Dimensions.calculateHeight(20)),
                                    bottomRight: Radius.circular(Dimensions.calculateHeight(20))
                                ) ,
                                color: Colors.white),


                            child: Padding(
                              padding: EdgeInsets.only(left: Dimensions.calculateWidth(10), right: Dimensions.calculateWidth(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //Actual texts
                                children: [
                                  BigText(text: recommendedProducts.recommendedProductList[index].name!),
                                  SizedBox(height: Dimensions.calculateHeight(10)),
                                  SmallText(text: "${recommendedProducts.recommendedProductList[index].description!.substring(0,50)}..."),
                                  SizedBox(height: Dimensions.calculateHeight(10)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconAndTextWidget(icon: Icons.circle_sharp, text: "Normal", iconColor: AppColors.iconColor1),

                                      IconAndTextWidget(icon: Icons.location_on, text: "1.7km", iconColor: AppColors.mainColor),

                                      IconAndTextWidget(icon: Icons.access_time_rounded, text: "32min", iconColor:AppColors.iconColor2)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],

                    ),
                  ),
                );
              }),
        ) : CircularProgressIndicator(color: AppColors.mainColor,);
      })
      ]
    );
  }


  Widget _buildPageItem(int index, ProductModel popularProduct){
    final double height = Dimensions.calculateHeight(200);
    Matrix4 matrix = Matrix4.identity();



    if(index == _currentPageValue.floor()) {
      var currentScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currentTransformation = height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0,currentTransformation, 0);

    }
    else if(index == _currentPageValue.floor()+1) {
      var currentScale = _scaleFactor + (_currentPageValue-index+1)*(1-_scaleFactor);
      var currentTransformation = height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTransformation, 0);
    }
    else if(index == _currentPageValue.floor()-1){
      var currentScale = 1- (_currentPageValue-index)*(1-_scaleFactor);
      var currentTransformation = height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTransformation, 0);
    } else  {
      var currentScale = 0.8;
      var currentTransformation = height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTransformation, 0);
    }


    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          //Background image
          GestureDetector(
            onTap: () {

              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.calculateHeight(220),
              margin: EdgeInsets.only(left:Dimensions.calculateWidth(15) , right: Dimensions.calculateWidth(15), top: Dimensions.calculateHeight(10)),
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(Dimensions.calculateHeight(30)),
                  color: index.isEven? Color(0xFF59c5df) : Color(0xFF9294cc),
                  image: DecorationImage(image: AssetImage("assets/image/${popularProduct.img!}"),
                      fit: BoxFit.cover)
              ),

            ),
          ),
          // Information about food
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.calculateHeight(120),
              margin: EdgeInsets.only(left:Dimensions.calculateWidth(30) , right: Dimensions.calculateWidth(30),bottom: Dimensions.calculateHeight(30)),
              decoration: BoxDecoration
                (
                  borderRadius:BorderRadius.circular(Dimensions.calculateHeight(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: Dimensions.calculateHeight(5),
                      offset: Offset(0, Dimensions.calculateHeight(5))
                    ),
                    BoxShadow(
                      color: Colors.white,

                      offset: Offset(Dimensions.calculateWidth(-5),0)
                    ),
                    BoxShadow(
                        color: Colors.white,

                        offset: Offset(Dimensions.calculateWidth(5),0)
                    )
                  ]
                ),
              //Description
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.calculateHeight(15),left: Dimensions.calculateWidth(15),right: Dimensions.calculateWidth(15)),
                child: FoodGeneralInfo(foodName: popularProduct.name!),

              ),


            ),

            ),
        ],
      ),
    );

  }
}
