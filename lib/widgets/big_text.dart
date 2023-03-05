import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;

  const BigText({Key? key,this.overflow=TextOverflow.ellipsis,required this.text,this.size=0,this.color=const Color(0xFF332d2b)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        color: color,
        overflow: overflow,
        fontWeight: FontWeight.w400,
        fontSize: size==0?Dimensions.height20:size,
        fontFamily: "Roboto"
      ),
    );
  }
}
