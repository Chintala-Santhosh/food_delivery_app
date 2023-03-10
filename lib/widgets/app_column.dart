import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/small.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         BigText(text: text,size: Dimensions.fontSize26,),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => const Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 15,
                      )),
            ),
            const SizedBox(
              width: 10,
            ),
            const SmallText(text: "4.5"),
            const SizedBox(
              width: 10,
            ),
            const SmallText(text: "1287"),
            const SizedBox(
              width: 10,
            ),
            const SmallText(text: "comments")
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndText(
              icon: Icons.circle_rounded,
              text: 'Normal',
              iconColor: AppColors.mainColor,
            ),
            IconAndText(
              icon: Icons.location_on,
              text: '1.4 km',
              iconColor: AppColors.mainColor,
            ),
            IconAndText(
              icon: Icons.access_alarm_outlined,
              text: '32 min',
              iconColor: AppColors.mainColor,
            )
          ],
        )
      ],
    );
  }
}
