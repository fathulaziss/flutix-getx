import 'package:flutix/app/modules/transaction_history/components/transaction_history_empty.dart';
import 'package:flutix/app/modules/transaction_history/components/transaction_history_item.dart';
import 'package:flutix/app/modules/transaction_history/components/transaction_history_wallet.dart';
import 'package:flutix/app/modules/transaction_history/controllers/transaction_history_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/others/loading_indicator.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionHistoryView extends GetView<TransactionHistoryController> {
  const TransactionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDefault(
      title: 'transactionHistory'.tr,
      backgroundColor: AppColor.backgroundColor1,
      child: Obx(() {
        return Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(Insets.xl),
              child: const TransactionHistoryWallet(),
            ),
            Padding(
              padding: EdgeInsets.only(left: Insets.xl),
              child: Text(
                'transactionList'.tr,
                style: TextStyles.title.copyWith(fontSize: 14.w),
              ),
            ),
            verticalSpace(Insets.xs),
            Expanded(
              child: controller.isLoading.value
                  ? LoadingIndicatorBounce(size: 25.w)
                  : controller.listTransactionHistory.isNotEmpty
                      ? ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: controller.listTransactionHistory.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: index == 0 ? 10.w : 0,
                                bottom: index ==
                                        controller
                                                .listTransactionHistory.length -
                                            1
                                    ? 65.w
                                    : 0.w,
                              ),
                              child: TransactionHistoryItem(
                                data: controller.listTransactionHistory[index],
                              ),
                            );
                          },
                        )
                      : const TransactionHistoryEmpty(),
            ),
          ],
        );
      }),
    );
  }
}
