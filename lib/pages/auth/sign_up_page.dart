import 'dart:math';

import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/app_text_field.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
        
            Container(
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
      ),
    );
  }
}
