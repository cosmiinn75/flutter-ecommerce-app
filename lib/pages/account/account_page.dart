import 'package:e_commerce/base/custom_loader.dart';
import 'package:e_commerce/data/controller/auth_controller.dart';
import 'package:e_commerce/data/controller/user_controller.dart';
import 'package:e_commerce/data/model/user_model.dart';
import 'package:e_commerce/route/route_helper.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/account_widget.dart';
import 'package:e_commerce/widget/app_icon.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../data/controller/cart_controller.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    late UserModel? user;
    bool userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (userLoggedIn) {
      user =Get.find<UserController>().getUserData();
    }
    else {
      user = null;
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: BigText(
            text: "Profile",
            size: Dimensions.calculateHeight(30),
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<UserController>(
        builder: (userController) {
          return userLoggedIn
              ? (!userController.isLoading ? Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: Dimensions.calculateHeight(20),
                        bottom: Dimensions.calculateHeight(20),
                      ),
                      width: double.maxFinite,
                      child: Center(
                        child: AppIcon(
                          iconData: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconSize: Dimensions.calculateHeight(75),
                          size: Dimensions.calculateHeight(150),
                          iconColor: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            //Name
                            AccountWidget(
                              icon: AppIcon(
                                iconData: Icons.person,
                                backgroundColor: AppColors.mainColor,
                                iconSize: Dimensions.calculateHeight(25),
                                size: Dimensions.calculateHeight(50),
                                iconColor: Colors.white,
                              ),
                              bigText: BigText(text:user != null ? user.name : ""),
                            ),

                            SizedBox(height: Dimensions.calculateHeight(20)),
                            //Phone
                            AccountWidget(
                              icon: AppIcon(
                                iconData: Icons.phone,
                                backgroundColor: AppColors.yellowColor,
                                iconSize: Dimensions.calculateHeight(25),
                                size: Dimensions.calculateHeight(50),
                                iconColor: Colors.white,
                              ),
                              bigText: BigText(text: user != null ? user.phone : ""),
                            ),

                            SizedBox(height: Dimensions.calculateHeight(20)),
                            //Email
                            AccountWidget(
                              icon: AppIcon(
                                iconData: Icons.email,
                                backgroundColor: AppColors.yellowColor,
                                iconSize: Dimensions.calculateHeight(25),
                                size: Dimensions.calculateHeight(50),
                                iconColor: Colors.white,
                              ),
                              bigText: BigText(
                                text: user != null ? user.email : "",
                              ),
                            ),

                            SizedBox(height: Dimensions.calculateHeight(20)),
                            //Adress
                            AccountWidget(
                              icon: AppIcon(
                                iconData: Icons.location_on,
                                backgroundColor: AppColors.yellowColor,
                                iconSize: Dimensions.calculateHeight(25),
                                size: Dimensions.calculateHeight(50),
                                iconColor: Colors.white,
                              ),
                              bigText: BigText(text: "Fill in your adress"),
                            ),

                            SizedBox(height: Dimensions.calculateHeight(20)),
                            //Message
                            AccountWidget(
                              icon: AppIcon(
                                iconData: Icons.message,
                                backgroundColor: Colors.redAccent,
                                iconSize: Dimensions.calculateHeight(25),
                                size: Dimensions.calculateHeight(50),
                                iconColor: Colors.white,
                              ),
                              bigText: BigText(text: ""),
                            ),

                            SizedBox(height: Dimensions.calculateHeight(20)),
                            GestureDetector(
                              onTap: () {
                                if (Get.find<AuthController>().userLoggedIn()) {
                                  Get.find<AuthController>().clearSharedData();
                                  Get.find<CartController>().clear();
                                  Get.find<CartController>().clearCartHistory();
                                  print("Am apasat");
                                  Get.offNamed(RouteHelper.getSignIn());
                                }
                              },
                              child: AccountWidget(
                                icon: AppIcon(
                                  iconData: Icons.logout,
                                  backgroundColor: Colors.redAccent,
                                  iconSize: Dimensions.calculateHeight(25),
                                  size: Dimensions.calculateHeight(50),
                                  iconColor: Colors.white,
                                ),
                                bigText: BigText(text: "Logout"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ) : CustomLoader())
              : Container(child: Center(child:Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                Container(
                  width: double.maxFinite,
                  height: Dimensions.calculateHeight(120),
                  margin: EdgeInsets.only(left: Dimensions.calculateWidth(20),right: Dimensions.calculateWidth(20)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.calculateHeight(20)),
                      image: DecorationImage(image: AssetImage("assets/image/logo_part_1.png"), fit: BoxFit.cover)
                  ),

                ),
                GestureDetector(
                  onTap:(){
                    Get.toNamed(RouteHelper.signIn);
                  },
                  child: Container(
                                  width: double.maxFinite,
                                  height: Dimensions.calculateHeight(100),
                                  margin: EdgeInsets.only(left: Dimensions.calculateWidth(20),right: Dimensions.calculateWidth(20)),
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                      borderRadius: BorderRadius.circular(Dimensions.calculateHeight(20)),

                                  ),
                    child: Center(child: BigText(text: "Sign in",color: Colors.white,size: 26)),

                                ),
                ),

                            ],
                          ),
              )));
        },
      ),
    );
  }
}
