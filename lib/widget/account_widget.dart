import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/app_icon.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  final AppIcon icon;
  final BigText bigText;

 const AccountWidget({super.key, required this.icon, required this.bigText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.calculateWidth(20),
        top: Dimensions.calculateHeight(10),
        bottom: Dimensions.calculateHeight(10),
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: Dimensions.calculateWidth(20)),
          bigText,
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            color: Colors.grey.withValues(alpha: 0.2),
          ),
        ],
      ),
    );
  }
}
