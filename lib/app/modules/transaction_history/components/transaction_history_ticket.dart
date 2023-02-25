import 'package:flutix/styles/colors.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionHistoryTicket extends StatelessWidget {
  const TransactionHistoryTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return CardApp(
      width: 60.w,
      height: 80.w,
      constraints: BoxConstraints(minHeight: 80.w),
      padding: EdgeInsets.all(10.w),
      radius: 10.w,
      color: AppColor.backgroundColor2,
      child: Center(
        child: Image.asset(AppAsset.logo('logo_app.png')),
      ),
    );
  }
}
