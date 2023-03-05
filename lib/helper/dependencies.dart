import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/data/controller/popular_product_controller.dart';
import 'package:food_delivery_app/data/repository/recommended_product_repo.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';
import '../data/controller/recommended_product_controller.dart';
import '../data/repository/popular_product_repo.dart';

Future<void> init()async{
  //api client
 Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));
 // repo
 Get.lazyPut(()=>PopularProductRepo(apiClient:Get.find()));
 Get.lazyPut(()=>RecommendedProductRepo(apiClient:Get.find()));
 // controller
 Get.lazyPut(()=>PopularProductController(popularProductRepo:Get.find()));
 Get.lazyPut(()=>RecommendedProductController(recommendedProductRepo:Get.find()));
}