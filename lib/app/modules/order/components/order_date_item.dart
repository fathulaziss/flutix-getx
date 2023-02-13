import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/format_date_time.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDateItem extends StatelessWidget {
  const OrderDateItem({
    super.key,
    required this.isSelected,
    required this.data,
    required this.margin,
    required this.onTap,
  });

  final bool isSelected;
  final DateTime data;
  final EdgeInsets margin;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardApp(
        width: 55.w,
        padding: EdgeInsets.all(Insets.sm),
        margin: margin,
        color: isSelected ? AppColor.yellowColor1 : Colors.white,
        isOutlined: true,
        outlineColor:
            isSelected ? AppColor.yellowColor1 : AppColor.disabledColor2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(FormatDateTime.shortDayName(data), style: TextStyles.text),
            verticalSpace(Insets.xs),
            Text('${data.day}', style: TextStyles.text),
          ],
        ),
      ),
    );
  }
}
