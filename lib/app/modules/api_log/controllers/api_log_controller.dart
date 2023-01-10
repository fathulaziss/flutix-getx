import 'package:flutix/app/modules/api_log/models/api_log_model.dart';
import 'package:get/get.dart';

class ApiLogController extends GetxController {
  var apiLogs = <ApiLogModel>[].obs;
  RxList<bool> isOpen = RxList.generate(100, (index) => false);
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getLogs();
  }

  Future<void> getLogs() async {
    isLoading(true);
    final data = await ApiLogger().apiLogs();
    apiLogs(data.reversed.toList());
    isLoading(false);
  }
}
