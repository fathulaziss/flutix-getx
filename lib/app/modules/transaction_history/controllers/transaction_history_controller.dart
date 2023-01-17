import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutix/app/controllers/user_info_controller.dart';
import 'package:flutix/app/models/transaction_history_model.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:get/get.dart';

class TransactionHistoryController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  RxList<TransactionHistoryModel> listTransactionHistory =
      <TransactionHistoryModel>[].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getTransactionHistory();
    super.onInit();
  }

  Future<void> getTransactionHistory() async {
    try {
      isLoading(true);

      final collectionTransaction =
          FirebaseFirestore.instance.collection('transactions');

      final result = await collectionTransaction.get();

      await Future.delayed(const Duration(seconds: 2));

      if (result.docs.isNotEmpty) {
        final document = result.docs.where(
          (element) =>
              element.data()['user_id'] == cUserInfo.dataUser.value.userId,
        );

        listTransactionHistory(
          RxList.from(
            document.map((e) => TransactionHistoryModel.fromJson(e.data())),
          ),
        );

        listTransactionHistory.sort(
          (a, b) => b.transactionDate.compareTo(a.transactionDate),
        );
      }

      isLoading(false);
    } catch (e) {
      isLoading(false);
      logSys(e.toString());
    }
  }
}
