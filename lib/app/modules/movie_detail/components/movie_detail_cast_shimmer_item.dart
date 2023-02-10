import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/others/shimmer_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailCastShimmerItem extends StatelessWidget {
  const MovieDetailCastShimmerItem({super.key, required this.margin});

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        width: 70.w,
        child: Column(
          children: [
            ShimmerIndicator(
              width: 70.w,
              height: 100.w,
              borderRadius: Insets.med,
            ),
            verticalSpace(Insets.xs),
            ShimmerIndicator(width: 60.w, height: 6.w, borderRadius: 2.w),
            verticalSpace(Insets.xs),
            ShimmerIndicator(width: 40.w, height: 6.w, borderRadius: 2.w),
          ],
        ),
      ),
    );
  }
}
