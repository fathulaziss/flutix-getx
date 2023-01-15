import 'package:flutix/app/controllers/user_info_controller.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  RxBool isLoadingDataUser = false.obs;
  RxBool isLoadingMoviePlaying = false.obs;

  @override
  void onInit() {
    getDataUser();
    super.onInit();
  }

  Future<void> getDataUser() async {
    try {
      isLoadingDataUser(true);

      await cUserInfo.getDataUser();
      await Future.delayed(const Duration(seconds: 2));

      isLoadingDataUser(false);
    } catch (e) {
      isLoadingDataUser(false);
      logSys(e.toString());
    }
  }
}
