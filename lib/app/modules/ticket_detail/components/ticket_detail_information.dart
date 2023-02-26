import 'package:flutix/app/models/ticket_model.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/format_currency.dart';
import 'package:flutix/utils/format_date_time.dart';
import 'package:flutix/widgets/others/trx_item_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketDetailInformation extends StatelessWidget {
  const TicketDetailInformation({super.key, required this.data});

  final TicketModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Insets.med),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TrxItemRow(label: 'orderId'.tr, value: data.orderId),
          TrxItemRow(
            label: 'dateAndTime'.tr,
            value:
                '${FormatDateTime.shortDayName(DateTime.fromMillisecondsSinceEpoch(data.selectedDate))}, ${DateTime.fromMillisecondsSinceEpoch(data.selectedDate).day} ${FormatDateTime.shortMonthName(DateTime.fromMillisecondsSinceEpoch(data.selectedDate))} ${DateTime.fromMillisecondsSinceEpoch(data.selectedDate).year} ${data.showtime}',
          ),
          TrxItemRow(label: 'cinema'.tr, value: data.cinema),
          TrxItemRow(label: 'seats'.tr, value: data.seats.join(', ')),
          TrxItemRow(label: 'Total', value: priceFormat(data.total)),
        ],
      ),
    );
  }
}
