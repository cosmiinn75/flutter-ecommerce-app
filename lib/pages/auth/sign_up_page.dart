import 'dart:math';

import 'package:e_commerce/base/custom_loader.dart';
import 'package:e_commerce/base/show_custom_snackbar.dart';
import 'package:e_commerce/data/controller/auth_controller.dart';
import 'package:e_commerce/data/model/signup_body_model.dart';
import 'package:e_commerce/route/route_helper.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/app_text_field.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    var signupImages = [
      "t.jfif",
      "g.jpg",
      "f.png"
    ];

    void _registration(AuthController authController){
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(name.isEmpty) {
          showCustomSnackBar("Type in your name",title: "Name");
      }else if(phone.isEmpty){
        showCustomSnackBar("Type in your phone number",title: "Phone number");
      }else if(email.isEmpty){
        showCustomSnackBar("Type in your email",title: "Email address");
      }else if(!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email",title: "Valid email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password",title: "Password");
      } else if(password.length < 6){
        showCustomSnackBar("Password must have at least 6 characters",title: "Password not long enough");
      }else {
        showCustomSnackBar("All went well",title: "Perfect");
        SignupBody signupBody = SignupBody(name: name, phone: phone, email: email, password: password);
        authController.registration(signupBody).then((status){
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
      body: GetBuilder<AuthController>(builder: (authController){
        return authController.isLoading ? CustomLoader(): SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
              SizedBox(height: Dimensions.calculateHeight(20)),
              AppTextField(
                iconData: Icons.person,
                textController: nameController,
                hintText: "Name",
              ),
              SizedBox(height: Dimensions.calculateHeight(20)),
              AppTextField(
                iconData: Icons.phone,
                textController: phoneController,
                hintText: "Phone",
              ),
              SizedBox(height: Dimensions.calculateHeight(40)),

              GestureDetector(

                onTap: (){
                  _registration(authController);

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
                      text: "Sign up",
                      size: Dimensions.calculateHeight(30),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.calculateHeight(10)),
              RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "Have an account already?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.calculateHeight(17),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.screenHeight*0.03),
              RichText(
                text: TextSpan(
                  text:"Sign up using one of the following methods",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.calculateHeight(17),
                  ),
                ),
              ),
              Wrap(
                children: List.generate(3, (index)=>Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: Dimensions.calculateHeight(30),backgroundImage: AssetImage("assets/image/${signupImages[index]}"),
                  ),
                )),
              )
            ],
          ),
        );
      })
    );




  }



}
