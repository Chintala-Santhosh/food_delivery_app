import 'package:food_delivery_app/Modules/food_details/popular_food_details.dart';
import 'package:food_delivery_app/Modules/food_details/recomended_food_details_page.dart';
import 'package:food_delivery_app/Modules/home/fd_main_screen.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial ="/";
  static const String popularFoodDetailPage ="/popular-food-detail-page";
  static const String recommendedFoodDetailPage ="/recommended-food-detail-page";
  static String getInitial() =>initial;
  static String getPopularFood(int pageId) =>"$popularFoodDetailPage?pageId=$pageId";
  static String getRecommendedFood(int pageId) =>"$recommendedFoodDetailPage?pageId=$pageId";



  static  List<GetPage> routes =[
    GetPage(name: initial, page: ()=>const MainFoodPage()),
    GetPage(name:popularFoodDetailPage, page: (){
      var pageId=Get.parameters["pageId"];
      return  PopularFoodDetails(pageId:int.parse(pageId!));
    } ,
      transition: Transition.fade,
    ),
    GetPage(name:recommendedFoodDetailPage, page: (){
      var pageId=Get.parameters["pageId"];
      return RecommendedFoodDetails(pageId:int.parse(pageId!));
    } ,
      transition: Transition.fade,
    ),
  ];
}