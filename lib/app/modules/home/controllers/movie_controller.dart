import 'package:flutix/app/controllers/user_info_controller.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  RxBool isLoadingDataUser = false.obs;
  RxBool isLoadingMoviePlaying = false.obs;
}
