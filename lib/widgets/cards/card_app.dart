import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardApp extends StatelessWidget {
  const CardApp({
    super.key,
    this.margin,
    this.padding,
    this.radius,
    this.width,
    this.height,
    this.child,
    this.color,
    this.outlineColor,
    this.borderWidth,
    this.isOutlined = false,
    this.decoration,
    this.constraints,
    this.isShowShadows = false,
    this.shadows,
  });

  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? radius;
  final double? width;
  final double? height;
  final Widget? child;
  final Color? color;
  final Color? outlineColor;
  final double? borderWidth;
  final bool isOutlined;
  final BoxDecoration? decoration;
  final BoxConstraints? constraints;
  final bool isShowShadows;
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      height: height,
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.all(Insets.med),
      constraints: constraints ?? BoxConstraints(minHeight: 48.w),
      decoration: decoration ??
          (isOutlined
              ? BoxDecoration(
                  color: color ?? Colors.white,
                  borderRadius: BorderRadius.circular(radius ?? Insets.sm),
                  border: Border.all(
                    color: outlineColor ?? Colors.grey,
                    width: borderWidth ?? 1,
                  ),
                  boxShadow:
                      isShowShadows ? shadows ?? Shadows.small : Shadows.none,
                )
              : BoxDecoration(
                  color: color ?? Colors.white,
                  borderRadius: BorderRadius.circular(radius ?? Insets.sm),
                  boxShadow:
                      isShowShadows ? shadows ?? Shadows.small : Shadows.none,
                )),
      child: child,
    );
  }
}
