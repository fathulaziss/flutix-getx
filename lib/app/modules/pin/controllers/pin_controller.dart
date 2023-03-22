import 'package:flutix/constants/constant.dart';
import 'package:flutix/utils/app_storage.dart';
import 'package:flutix/widgets/others/show_dialog.dart';
import 'package:get/get.dart';

class PinController extends GetxController {
  RxString pin = ''.obs;

  void setPin(String value) {
    pin('${pin.value}$value');
    validatePin();
  }

  void deletePin() {
    if (pin.value.isNotEmpty) {
      pin(pin.value.substring(0, pin.value.length - 1));
    }
  }

  void resetPin() {
    pin('');
    Get.back();
  }

  Future<void> validatePin() async {
    final pinUser = await AppStorage.read(key: CACHE_PIN);
    if (pin.value.length == 6) {
      if (pin.value == pinUser) {
        Get.back(result: pin.value);
      } else {
        showPopUpInfo(
          title: 'Error',
          description: 'incorrectPin'.tr,
          onPress: resetPin,
        );
      }
    }
  }
}
