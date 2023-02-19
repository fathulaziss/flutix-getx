import 'package:flutix/app/models/transaction_history_model.dart';
import 'package:flutix/app/modules/transaction_history/components/transaction_history_ticket.dart';
import 'package:flutix/app/modules/transaction_history/components/transaction_history_topup.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/format_currency.dart';
import 'package:flutix/utils/format_date_time.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionHistoryItem extends StatelessWidget {
  const TransactionHistoryItem({super.key, required this.data});

  final TransactionHistoryModel data;

  @override
  Widget build(BuildContext context) {
    return CardApp(
      margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.w),
      radius: 16.w,
      isShowShadows: true,
      shadows: Shadows.shadowsUp,
      child: Row(
        children: [
          if (data.transactionType == 'Ticket')
            const TransactionHistoryTicket()
          else
            const TransactionHistoryTopup(),
          horizontalSpace(Insets.sm),
          Expanded(
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.transactionType == 'Ticket'
                      ? data.title.replaceAll(RegExp('Ticket'), 'ticket'.tr)
                      : data.title.replaceAll(RegExp('Top Up'), 'topup'.tr),
                  style: TextStyles.title.copyWith(fontSize: 12.w),
                ),
                verticalSpace(Insets.xs),
                Text(
                  '${(data.transactionType == 'Ticket') ? '-' : '+'} ${priceFormat(data.amount)}',
                  style: (data.transactionType == 'Ticket')
                      ? TextStyles.title
                          .copyWith(fontSize: 12.w, color: AppColor.redColor)
                      : TextStyles.title
                          .copyWith(fontSize: 12.w, color: AppColor.greenColor),
                ),
                verticalSpace(Insets.xs),
                Text(
                  FormatDateTime.format(
                    format: DateFormat(
                      'dd MMM yyyy',
                      '${Get.locale!.languageCode}_${Get.locale!.countryCode}',
                    ),
                    value: data.transactionDate,
                  ),
                  style:
                      TextStyles.desc.copyWith(color: AppColor.disabledColor2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
