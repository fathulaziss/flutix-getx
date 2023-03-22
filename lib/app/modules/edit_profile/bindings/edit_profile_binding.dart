import 'package:flutix/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:get/get.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(EditProfileController.new);
  }
}
