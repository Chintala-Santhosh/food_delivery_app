import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndText({Key? key,
    required this.icon,
    required this.text,
    required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon,color: iconColor,size: 15,),
        SmallText(text: text),
        SizedBox(width: Dimensions.width10,)
      ],
    );
  }
}
