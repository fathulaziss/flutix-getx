import 'package:flutix/app/models/ticket_model.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketDetailQr extends StatelessWidget {
  const TicketDetailQr({super.key, required this.data});

  final TicketModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'scanQr'.tr,
          style: TextStyles.title.copyWith(fontSize: 14.w),
          textAlign: TextAlign.center,
        ),
        verticalSpace(Insets.med),
        InkWell(
          onTap: () {
            Get.dialog(
              Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CardApp(
                  padding: EdgeInsets.zero,
                  radius: Insets.med,
                  child: QrImageView(data: data.orderId),
                ),
              ),
              barrierDismissible: true,
            );
          },
          child: CardApp(
            width: 150.w,
            height: 150.w,
            padding: EdgeInsets.zero,
            child: QrImageView(data: data.orderId),
          ),
        ),
        verticalSpace(Insets.med),
      ],
    );
  }
}
