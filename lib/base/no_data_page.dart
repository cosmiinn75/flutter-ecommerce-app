import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class NoDataPage extends StatelessWidget {

  final String text;
  final String imgPath;
  const NoDataPage({super.key, required this.text, this.imgPath = "assets/image/empty_cart_image.png"});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(imgPath, height: MediaQuery.of(context).size.height*0.22,width: MediaQuery.of(context).size.width*0.22,),
        SizedBox(height: MediaQuery.of(context).size.height*0.03),
        Text(text, textAlign: TextAlign.center,style: TextStyle(
          fontSize: MediaQuery.of(context).size.height*0.1775,
          color: Theme.of(context).disabledColor,
        ),),
      ],
    );
  }
}
