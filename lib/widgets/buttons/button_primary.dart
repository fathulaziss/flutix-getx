import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/others/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.textStyle,
    this.label,
    this.color,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.padding,
    this.margin,
    this.isLoading = false,
    this.enabled = true,
    this.isOutline = false,
    this.outlineColor,
    this.textColor,
  });

  final double? height;
  final double? width;
  final double? radius;
  final TextStyle? textStyle;
  final String? label;
  final Color? color;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool enabled;
  final bool isLoading;
  final bool isOutline;
  final Color? outlineColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: isLoading ? height ?? 42.w : width ?? Get.width,
        height: height ?? 42.w,
        decoration: isOutline
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(
                  isLoading ? 24.w : radius ?? Insets.sm,
                ),
                color: enabled
                    ? color ?? AppColor.primaryColor1
                    : Colors.transparent,
                border: Border.all(color: outlineColor ?? Colors.white),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(
                  isLoading ? 24.w : radius ?? Insets.sm,
                ),
                color: enabled
                    ? color ?? AppColor.primaryColor1
                    : AppColor.disabledColor1,
              ),
        child: Align(
          child: Material(
            color: Colors.transparent,
            child: isLoading
                ? LoadingIndicator(
                    color: Colors.white,
                    size: height != null ? height! - 8.w : 32.w,
                  )
                : InkWell(
                    onTap: enabled ? onTap ?? () {} : null,
                    child: Container(
                      margin: margin ?? EdgeInsets.zero,
                      padding: padding ?? EdgeInsets.zero,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: prefixIcon ?? const SizedBox(),
                            ),
                            Center(
                              child: Text(
                                label ?? 'BUTTON',
                                style: textStyle ??
                                    TextStyles.button.copyWith(
                                      color: enabled
                                          ? color ?? Colors.white
                                          : AppColor.disabledColor2,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: suffixIcon ?? const SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
