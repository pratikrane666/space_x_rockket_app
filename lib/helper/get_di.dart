import 'package:get/get.dart';
import 'package:space_x_rockket_app/controller/home_controller.dart';
import 'package:space_x_rockket_app/data/api/api_client.dart';
import 'package:space_x_rockket_app/data/repository/home_repo.dart';
import 'package:space_x_rockket_app/util/app_constants.dart';


Future init() async {
  Get.lazyPut(() => HomeController(itemRepo: Get.find()));
  Get.lazyPut(() => ItemRepo(apiClient: Get.find()));
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
}
