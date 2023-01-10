import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingSlidetileIndicator extends StatelessWidget {
  const OnboardingSlidetileIndicator({
    Key? key,
    required this.activeIndex,
  }) : super(key: key);

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSmoothIndicator(
        effect: JumpingDotEffect(
          dotHeight: 10.w,
          dotWidth: 10.w,
          spacing: Insets.lg,
          activeDotColor: AppColor.primaryColor,
        ),
        activeIndex: activeIndex,
        count: 3,
      ),
    );
  }
}
