import 'package:flutter/material.dart';
class BigText extends StatelessWidget {
  Color? color;
  String text;
  double size;
  TextOverflow overflow;

  BigText({Key? key,this.overflow=TextOverflow.ellipsis,required this.text,this.size=20,this.color=const Color(0xFF332d2b)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        color: color,
        overflow: overflow,
        fontWeight: FontWeight.w400,
        fontSize: size,
        fontFamily: "Roboto"
      ),
    );
  }
}
