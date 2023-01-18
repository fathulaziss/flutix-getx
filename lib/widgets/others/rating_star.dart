import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({super.key, required this.voteAverage});

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    final n = (voteAverage / 2).round();

    List<Widget> widgets;
    widgets = List<Widget>.generate(
      5,
      (index) => Icon(
        index < n ? Icons.star : Icons.star_outline,
        color: AppColor.yellowColor1,
        size: 18.w,
      ),
    )
      ..add(horizontalSpace(Insets.xs))
      ..add(
        Text(
          '$voteAverage/10',
          style: TextStyles.desc.copyWith(color: Colors.white),
        ),
      );

    return Row(children: widgets);
  }
}
