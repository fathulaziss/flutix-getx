import 'package:flutix/utils/app_utils.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxList<DateTime> listDate = <DateTime>[].obs;
  Rx<DateTime> selectedDate = DateTime(DateTime.now().year).obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}

  void initData() {
    getDates();
  }

  Future<void> getDates() async {
    try {
      final data = List.generate(
        7,
        (index) => DateTime.now().add(Duration(days: index)),
      );
      listDate(data);
      selectedDate.value = listDate[0];
    } catch (e) {
      logSys(e.toString());
    }
  }

  void setDate(DateTime value) {
    selectedDate(value);
  }
}
