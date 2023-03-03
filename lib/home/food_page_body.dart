import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small.dart';

import '../widgets/icon_and_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            // color: Colors.redAccent,
            height: Dimensions.pageView,
            child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              },
            )),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0,9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        SizedBox(height: Dimensions.height20,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: BigText(
                  text: ".",color: Colors.black26,
                ),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Food pairing",
                ),
              )
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
           physics: const NeverScrollableScrollPhysics(),
           itemCount: 10,
            itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
            child: Row(
              children: [
                Container(
                  height: Dimensions.listViewImageSize,
                  width: Dimensions.listViewImageSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white54,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/foodImage4.jpg"
                      )
                    )
                  ),

                ),
                Expanded(
                    child: Container(
                      height:Dimensions.listViewTextContainerSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20)
                    ),
                    color: Colors.white
                  ),
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            BigText(text: "Nutritious meal"),
                            SizedBox(height: Dimensions.height10,),
                            SmallText(text: "${Dimensions.listViewImageSize}"),
                            SizedBox(height: Dimensions.height10,),
                            Row(
                              children: [
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
                        ),
                      ),
                ))
              ],
            ),

          );
        })
      ],
    );
  }

  _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - currentScale) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(0xFF9294cc),
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/foodImage6.jpg"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5))
                  ]),
              child: Container(
                padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese Side"),
                     SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: 15,
                                  )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "4.5"),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "1287"),
                        const SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "comments")
                      ],
                    ),
                     SizedBox(
                      height: Dimensions.height20,
                    ),
                    Row(
                      children: [
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
