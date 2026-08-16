import 'dart:math';

import 'package:e_commerce/base/custom_loader.dart';
import 'package:e_commerce/pages/auth/sign_up_page.dart';
import 'package:e_commerce/route/route_helper.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/app_text_field.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../base/show_custom_snackbar.dart';
import '../../data/controller/auth_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();


    void _login(AuthController authController){
      String email = emailController.text.trim();
      String password = passwordController.text.trim();


       if(email.isEmpty){
        showCustomSnackBar("Type in your email",title: "Email address");
      }else if(!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email",title: "Valid email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password",title: "Password");
      } else if(password.length < 6){
        showCustomSnackBar("Password must have at least 6 characters",title: "Password not long enough");
      }else {
        showCustomSnackBar("All went well",title: "Perfect");

        authController.login(email,password).then((status){
          if(status.isSuccess){
            Get.toNamed(RouteHelper.getInitial());
          }else {
            showCustomSnackBar(status.message);
          }
        });
      }

    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController) {
        return authController.isLoading? CustomLoader() : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Dimensions.screenHeight * 0.25,
                margin: EdgeInsets.only(
                  top: Dimensions.calculateHeight(20),
                  bottom: Dimensions.calculateHeight(20),
                ),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: Dimensions.calculateHeight(80),
                    backgroundImage: AssetImage("assets/image/logo_part_1.png"),
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: Dimensions.calculateWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                        fontSize: Dimensions.calculateHeight(60),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign into your account",
                      style: TextStyle(
                        fontSize: Dimensions.calculateHeight(20),
                        // fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.calculateHeight(20),),
              AppTextField(
                iconData: Icons.email,
                textController: emailController,
                hintText: "Email",
              ),
              SizedBox(height: Dimensions.calculateHeight(20)),
              AppTextField(
                iconData: Icons.password_sharp,
                textController: passwordController,
                privateInfo: true,

                hintText: "Password",
              ),
              SizedBox(height: Dimensions.calculateHeight(30)),
              Container(
                margin: EdgeInsets.only(right: Dimensions.calculateHeight(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                        text: "Sign into your account",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.calculateHeight(17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.screenHeight * 0.04),

              //sign in button
              GestureDetector(
                onTap: (){
                  _login(authController);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.calculateHeight(30),
                    ),
                    color: AppColors.mainColor,
                  ),
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenHeight / 13,
                  child: Center(
                    child: BigText(
                      text: "Sign in",
                      size: Dimensions.calculateHeight(30),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: Dimensions.screenHeight * 0.04),
              RichText(
                text: TextSpan(
                  text: "Don\'t have an account? ",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.calculateHeight(17),
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = ()=> Get.to(()=>SignUpPage(),transition: Transition.fade),
                      text: "Create",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainBlackColor,
                        fontSize: Dimensions.calculateHeight(17),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      })
    );
  }
}
