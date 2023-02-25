import 'package:flutix/app/models/ticket_model.dart';
import 'package:flutix/app_config.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/utils/format_date_time.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutix/widgets/others/rating_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketItem extends StatelessWidget {
  const TicketItem({super.key, required this.data, required this.onTap});

  final TicketModel data;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardApp(
        margin: EdgeInsets.symmetric(horizontal: Insets.xl),
        radius: Insets.med,
        isShowShadows: true,
        child: Row(
          children: [
            CardApp(
              width: 70.w,
              height: 100.w,
              color: AppColor.backgroundColor2,
              padding: EdgeInsets.zero,
              radius: Insets.med,
              child: ClipRRect(
                borderRadius: Corners.medBorder,
                child: data.movie.posterPath.isNotEmpty
                    ? Image.network(
                        '${AppConfig.imageBaseUrl}w500${data.movie.posterPath}',
                        fit: BoxFit.cover,
                        width: 70.w,
                        height: 100.w,
                      )
                    : Center(
                        child: Padding(
                          padding: EdgeInsets.all(Insets.med),
                          child: Image.asset(AppAsset.logo('logo_app.png')),
                        ),
                      ),
              ),
            ),
            horizontalSpace(Insets.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.movie.title,
                    style: TextStyles.title.copyWith(fontSize: 14.w),
                  ),
                  Text(
                    '${FormatDateTime.shortDayName(DateTime.fromMillisecondsSinceEpoch(data.selectedDate))}, ${DateTime.fromMillisecondsSinceEpoch(data.selectedDate).day} ${FormatDateTime.shortMonthName(DateTime.fromMillisecondsSinceEpoch(data.selectedDate))} ${DateTime.fromMillisecondsSinceEpoch(data.selectedDate).year}; ${data.showtime}',
                    style: TextStyles.text
                        .copyWith(color: AppColor.disabledColor2),
                  ),
                  Text(
                    data.cinema,
                    style: TextStyles.text
                        .copyWith(color: AppColor.disabledColor2),
                  ),
                  RatingStar(voteAverage: data.movie.voteAverage),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
