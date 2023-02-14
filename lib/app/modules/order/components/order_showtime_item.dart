import 'package:flutix/app/models/showtime_model.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderShowtimeItem extends StatefulWidget {
  const OrderShowtimeItem({
    super.key,
    required this.data,
    required this.onChangeCinema,
    required this.onChangeShowtime,
    required this.selectedDate,
    required this.selectedShowtime,
  });

  final ShowtimeModel data;
  final ValueSetter<String> onChangeCinema;
  final ValueSetter<String> onChangeShowtime;
  final DateTime selectedDate;
  final String selectedShowtime;

  @override
  State<OrderShowtimeItem> createState() => _OrderShowtimeItemState();
}

class _OrderShowtimeItemState extends State<OrderShowtimeItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return CardApp(
      margin: EdgeInsets.only(
        left: Insets.xl,
        right: Insets.xl,
        bottom: Insets.med,
      ),
      padding: EdgeInsets.zero,
      color: AppColor.backgroundColor1,
      isOutlined: true,
      outlineColor: AppColor.disabledColor2,
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            widget.data.cinema,
            style: TextStyles.text.copyWith(fontWeight: FontWeight.bold),
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
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 24.w),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 2,
                mainAxisSpacing: 12.w,
                crossAxisSpacing: 12.w,
              ),
              itemCount: widget.data.schedule.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    widget.onChangeCinema(widget.data.cinema);
                    widget.onChangeShowtime(widget.data.schedule[index]);
                    final data = AppUtils.checkAvailShowtime(
                      selectedDate: widget.selectedDate,
                      showtime: widget.data.schedule[index],
                    );
                    logSys('selectedShowtime : ${widget.selectedShowtime}');
                    logSys('showtime : ${widget.data.schedule[index]}');
                  },
                  child: CardApp(
                    padding: EdgeInsets.zero,
                    radius: Insets.xs,
                    color: AppUtils.checkAvailShowtime(
                      selectedDate: widget.selectedDate,
                      showtime: widget.data.schedule[index],
                    )
                        ? AppColor.backgroundColor1
                        : widget.selectedShowtime == widget.data.schedule[index]
                            ? AppColor.primaryColor1
                            : AppColor.disabledColor2,
                    isOutlined: true,
                    outlineColor: AppColor.disabledColor2,
                    child: Center(
                      child: Text(
                        widget.data.schedule[index],
                        style: TextStyles.text
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
