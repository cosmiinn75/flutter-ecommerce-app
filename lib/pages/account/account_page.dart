import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/account_widget.dart';
import 'package:e_commerce/widget/app_icon.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
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
                      bigText: BigText(text: "Cosmin"),
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
                      bigText: BigText(text: "0123456789"),
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
                      bigText: BigText(text: "cosmin.v.anghel@gmail.com"),
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
                      bigText: BigText(text: "Cosmin"),
                    ),
                
                    SizedBox(height: Dimensions.calculateHeight(20)),


                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
