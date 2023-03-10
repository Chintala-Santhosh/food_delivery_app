import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key,
    required this.text
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText=true;
  double textHeight=Dimensions.screenHeight/5.63;

  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf=widget.text.substring(0,textHeight.toInt());
      secondHalf=widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }else{
      firstHalf=widget.text;
      secondHalf="";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ?SmallText(text: firstHalf)
          :Column(
        children: [
          SmallText(
            size: Dimensions.fontSize16,
              height: 1.8,
              text: hiddenText
                  ?(firstHalf+"...")
                  :(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
                setState(() {
                  hiddenText=!hiddenText;
                });
            },
            child: Row(
              children: [
                const SmallText(text: "Show more",color: AppColors.mainColor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up)
              ],
            ),
          )
        ],
      ),
    );
  }
}
