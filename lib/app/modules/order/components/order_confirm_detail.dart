import 'package:flutix/app/modules/order/controllers/order_confirm_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/format_currency.dart';
import 'package:flutix/utils/format_date_time.dart';
import 'package:flutix/widgets/others/trx_item_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderConfirmDetail extends GetView<OrderConfirmController> {
  const OrderConfirmDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TrxItemRow(label: 'orderId'.tr, value: controller.orderId.value),
        TrxItemRow(
          label: 'cinema'.tr,
          value: controller.cOrder.selectedCinema.value,
        ),
        TrxItemRow(
          label: 'dateAndTime'.tr,
          value:
              '${FormatDateTime.shortDayName(controller.cOrder.selectedDate.value)}, ${controller.cOrder.selectedDate.value.day} ${FormatDateTime.shortMonthName(controller.cOrder.selectedDate.value)} ${controller.cOrder.selectedDate.value.year} ${controller.cOrder.selectedShowtime}',
        ),
        TrxItemRow(
          label: 'seats'.tr,
          value: controller.cOrderSeat.selectedSeats.join(', '),
        ),
        TrxItemRow(
          label: 'price'.tr,
          value:
              '${priceFormat(controller.cOrder.ticketPrice.value)} x ${controller.cOrderSeat.selectedSeats.length}',
        ),
        TrxItemRow(
          label: 'fee'.tr,
          value:
              '${priceFormat(controller.fee)} x ${controller.cOrderSeat.selectedSeats.length}',
        ),
        TrxItemRow(
          label: 'Total',
          value: priceFormat(controller.totalPrice.value),
        ),
        verticalSpace(Insets.sm),
        const Divider(color: AppColor.disabledColor2),
        verticalSpace(Insets.sm),
      ],
    );
  }
}
