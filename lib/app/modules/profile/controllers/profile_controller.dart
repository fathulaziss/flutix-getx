import 'package:flutix/app/controllers/user_info_controller.dart';
import 'package:flutix/app/controllers/utility_controller.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();
  final cUtility = Get.find<UtilityController>();
}
