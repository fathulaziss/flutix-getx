import 'package:flutix/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRing(
        size: size ?? 32.w,
        lineWidth: 3,
        color: color ?? AppColor.primaryColor1,
      ),
    );
  }
}

class LoadingIndicatorBounce extends StatelessWidget {
  const LoadingIndicatorBounce({
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        size: size ?? 12.w,
        color: color ?? AppColor.primaryColor1,
      ),
    );
  }
}
