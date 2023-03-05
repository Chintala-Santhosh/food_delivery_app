import 'package:flutter/material.dart';
class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;

  const SmallText({Key? key, this.height=1.2,required this.text,this.size=14,this.color=const Color(0xFFccc7c5)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: "Roboto"
      ),
    );
  }
}
