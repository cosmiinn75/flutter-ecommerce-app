import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AppTextField extends StatelessWidget {

  final TextEditingController textController;
  final String hintText;
  final IconData iconData;
  const AppTextField({super.key,required this.iconData ,required this.textController,required this.hintText});


  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.calculateHeight(30),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 7,
            offset: Offset(1, 10),
            color: Colors.grey.withValues(alpha: 0.2),
          ),
        ],
      ),
      margin: EdgeInsets.only(
        left: Dimensions.calculateWidth(15),
        right: Dimensions.calculateWidth(15),
      ),
      padding: EdgeInsets.only(
        left: Dimensions.calculateWidth(15),
        right: Dimensions.calculateWidth(15),
      ),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(iconData, color: AppColors.yellowColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.calculateHeight(30),
            ),
            borderSide: BorderSide(width: 1.0, color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.calculateHeight(30),
            ),
            borderSide: BorderSide(width: 1.0, color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.calculateHeight(30),
            ),
            borderSide: BorderSide(width: 1.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
