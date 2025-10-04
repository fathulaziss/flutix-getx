import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSeatIndicatorItem extends StatelessWidget {
  const OrderSeatIndicatorItem({
    super.key,
    required this.label,
    this.color = AppColor.backgroundColor1,
    this.outlineColor = AppColor.disabledColor2,
  });

  final String label;
  final Color color;
  final Color outlineColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CardApp(
          width: 18.w,
          height: 18.w,
          constraints: BoxConstraints(minHeight: 18.w, minWidth: 18.w),
          isOutlined: true,
          color: color,
          outlineColor: outlineColor,
          radius: Insets.xs,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.only(right: Insets.sm),
        ),
        Text(label, style: TextStyles.desc),
      ],
    );
  }
}
