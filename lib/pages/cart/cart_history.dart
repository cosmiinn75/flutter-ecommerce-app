import 'dart:convert';

import 'package:e_commerce/base/no_data_page.dart';
import 'package:e_commerce/data/controller/cart_controller.dart';
import 'package:e_commerce/data/model/cart_model.dart';
import 'package:e_commerce/route/route_helper.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/app_icon.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>()
        .getCartHistoryList()
        .reversed
        .toList();

    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
          getCartHistoryList[i].time!,
          (value) => ++value,
        );
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    var listCounter = 0;

  Widget timeWidget(int index){

    var outputDate = DateTime.now().toString();
    if(index < getCartHistoryList.length){
      DateTime parseDate = DateFormat(
        "yyyy-MM-dd HH:mm:ss",
      ).parse(getCartHistoryList[listCounter].time!);
      var inputDate = DateTime.parse(
        parseDate.toString(),
      );
      var outputFormat = DateFormat(
        "MM/dd/yyyy hh:mm a",
      );

      outputDate = outputFormat.format(inputDate);
      return BigText(text: outputDate);
    }

    return BigText(text: outputDate);
  }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.calculateHeight(100),
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.calculateHeight(45)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart history", color: Colors.white),
                AppIcon(
                  iconData: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowColor,
                ),
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (cartController) {
            return cartController.getCartHistoryList().length > 0 ? Expanded(
              child: Container(
                height: Dimensions.calculateHeight(120),
                margin: EdgeInsets.only(
                  top: Dimensions.calculateHeight(20),
                  left: Dimensions.calculateWidth(20),
                  right: Dimensions.calculateWidth(20),
                ),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    children: [
                      for (int i = 0; i < itemsPerOrder.length; i++)
                        Container(
                          margin: EdgeInsets.only(
                            bottom: Dimensions.calculateHeight(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              timeWidget(listCounter),
                              SizedBox(height: Dimensions.calculateHeight(5)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    children: List.generate(itemsPerOrder[i], (
                                        index,
                                        ) {
                                      if (listCounter <
                                          getCartHistoryList.length) {
                                        listCounter++;
                                      }
                                      return index < 3
                                          ? Container(
                                        margin: EdgeInsets.only(
                                          right: Dimensions.calculateWidth(
                                            10,
                                          ),
                                        ),
                                        height: Dimensions.calculateHeight(
                                          80,
                                        ),
                                        width: Dimensions.calculateWidth(
                                          80,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                            Dimensions.calculateHeight(
                                              8,
                                            ),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "assets/image/${getCartHistoryList[listCounter - 1].img!}",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                          : Container();
                                    }),
                                  ),
                                  Container(
                                    height: Dimensions.calculateHeight(120),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        SmallText(
                                          text: "Total",
                                          color: AppColors.titleColor,
                                        ),
                                        BigText(
                                          text:
                                          itemsPerOrder[i].toString() +
                                              " Items",
                                          color: AppColors.titleColor,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            var orderTime = cartOrderTimeToList();

                                            Map<int,CartModel> moreOrder = {};
                                            for(int j = 0 ; j < getCartHistoryList.length ; j++){
                                              if(getCartHistoryList[j].time == orderTime[i]) {
                                                moreOrder.putIfAbsent(getCartHistoryList[j].id!,()=> CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j]))));
                                              }
                                            }

                                            Get.find<CartController>().setItems(moreOrder);
                                            Get.find<CartController>().addToCartList();
                                            Get.toNamed(RouteHelper.cartPage);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                              Dimensions.calculateWidth(10),
                                              vertical:
                                              Dimensions.calculateHeight(10),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                Dimensions.calculateHeight(5),
                                              ),
                                              border: Border.all(
                                                width: 1,
                                                color: AppColors.mainColor,
                                              ),
                                            ),
                                            child: SmallText(
                                              text: "one more",
                                              color: AppColors.mainColor,
                                            ),
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
                    ],
                  ),
                ),
              ),
            ) :

            Container(
                height: MediaQuery.of(context).size.height/1.5,
                child: NoDataPage(text: "You didn't buy anything so far" , imgPath: "assets/image/empty_history.png",));
          })
        ],
      ),
    );
  }
}
