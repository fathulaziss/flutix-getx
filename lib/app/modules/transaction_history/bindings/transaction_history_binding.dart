import 'package:flutix/app/modules/transaction_history/controllers/transaction_history_controller.dart';
import 'package:get/get.dart';

class TransactionHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionHistoryController>(TransactionHistoryController.new);
  }
}
