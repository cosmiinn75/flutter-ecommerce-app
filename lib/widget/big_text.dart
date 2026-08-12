import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {

  Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;

  BigText({super.key, this.color = const Color(0xFF332d2b), required this.text , this.size = 20, this.textOverflow = TextOverflow.ellipsis });


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(fontFamily: 'Roboto',color: color, fontSize: Dimensions.calculateHeight(size), fontWeight: FontWeight.w400),
    );
  }
}
