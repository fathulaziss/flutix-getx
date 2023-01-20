import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailCastItem extends StatelessWidget {
  const MovieDetailCastItem({super.key, required this.margin});

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        width: 80.w,
        child: Column(
          children: [
            CardApp(
              width: 80.w,
              height: 80.w,
              color: AppColor.yellowColor1,
            ),
            verticalSpace(Insets.xs),
            Text(
              'Muhamad Fathul Azis',
              style: TextStyles.desc.copyWith(color: AppColor.disabledColor2),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
