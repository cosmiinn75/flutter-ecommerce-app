import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;

  late String secondHalf;

  bool isHidden = true;

  double textHeight = Dimensions.calculateHeight(105);

  @override void initState() {

    super.initState();

    if(widget.text.length > textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }
    else {
      firstHalf = widget.text;
      secondHalf = "";
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty? SmallText(text: firstHalf, size: 15,color: AppColors.paraColor, height: 1.8,) : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SmallText(text: isHidden ? (firstHalf + "...") : (firstHalf+secondHalf),size: 15,color: AppColors.paraColor , height: 1.6,),
          SizedBox(height: Dimensions.calculateHeight(10)),
          InkWell(
            onTap: () {
              setState(() {
                isHidden = !isHidden;
              });
            },

            child: Row(
              children: [
                SmallText(text: isHidden ? "Show more" : "Show less" , color: AppColors.mainColor,size: 12,),
                SizedBox(width: Dimensions.calculateWidth(5),),
                Icon( isHidden? Icons.arrow_drop_down : Icons.arrow_drop_up, color:AppColors.mainColor)
              ],
            ),
          )
        ],
      )
    );
  }
}
