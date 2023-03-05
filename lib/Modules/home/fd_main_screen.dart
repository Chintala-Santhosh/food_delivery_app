import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small.dart';

import 'food_page_body.dart';
class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: const EdgeInsets.only(top: 45,bottom: 15),
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const BigText(text: "India",color: AppColors.mainColor,),
                      Row(
                        children: const [
                          SmallText(text: "Hyderabad",color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
              Center(
                child: Container(
                  child: const Icon(Icons.search,color: Colors.white,),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.mainColor

                  )),
              )
                ],
              )
            ),
          ),
          const Expanded(
              child: SingleChildScrollView(
            child:FoodPageBody() ,
          ))

        ],
      ),
    );
  }
}
