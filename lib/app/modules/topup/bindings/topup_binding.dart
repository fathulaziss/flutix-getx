import 'package:flutix/app/modules/topup/controllers/topup_controller.dart';
import 'package:flutix/app/modules/transaction_history/controllers/transaction_history_controller.dart';
import 'package:get/get.dart';

class TopupBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<TopupController>(() => TopupController())
      ..lazyPut<TransactionHistoryController>(
        () => TransactionHistoryController(),
      );
  }
}
