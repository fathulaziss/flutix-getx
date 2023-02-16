import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/format_currency.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderShowtimeCard extends StatefulWidget {
  const OrderShowtimeCard({
    super.key,
    required this.cinemaName,
    required this.ticketPrice,
    required this.cinemaSchedule,
  });

  final String cinemaName;
  final int ticketPrice;
  final Widget cinemaSchedule;

  @override
  State<OrderShowtimeCard> createState() => _OrderShowtimeCardState();
}

class _OrderShowtimeCardState extends State<OrderShowtimeCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return CardApp(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 12.w),
      padding: EdgeInsets.zero,
      color: AppColor.backgroundColor1,
      isOutlined: true,
      outlineColor: AppColor.disabledColor2,
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.cinemaName,
                style: TextStyles.desc.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                priceFormat(widget.ticketPrice),
                style: TextStyles.desc.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor1,
                ),
              ),
            ],
          ),
          trailing: AnimatedRotation(
            turns: isExpanded ? .5 : 0,
            duration: const Duration(milliseconds: 500),
            child: const Icon(
              Icons.keyboard_arrow_down,
              color: AppColor.primaryColor1,
            ),
          ),
          onExpansionChanged: (bool expanded) {
            setState(() => isExpanded = expanded);
          },
          children: [widget.cinemaSchedule],
        ),
      ),
    );
  }
}
