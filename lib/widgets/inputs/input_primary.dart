import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InputPrimary extends StatefulWidget {
  const InputPrimary({
    Key? key,
    this.label,
    this.hint = 'Type Here...',
    this.prefixIcon,
    this.suffixIcon,
    this.color,
    this.textColor = AppColor.primaryColor1,
    this.margin,
    this.padding,
    this.enable = true,
    this.controller,
    this.validation,
    this.inputFormatters,
    this.validationText = '',
    this.textStyle,
    this.hintStyle,
    this.errorTextStyle,
    this.keyboardType,
    this.maxLength = 1000,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.obsecureText = false,
    this.inputStyle = InputStyle.box,
    this.cursorColor = AppColor.primaryColor1,
    this.contentPadding,
    this.textAlign,
    this.outlineColor,
    this.borderRadius,
    this.hintColor,
    this.readOnly = false,
    this.onTap,
    this.textInputAction,
    this.onSubmitted,
    this.maxLines,
    this.minLines,
  }) : super(key: key);

  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? color;
  final Color textColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final bool enable;
  final TextEditingController? controller;
  final bool? Function(String value)? validation;
  final List<TextInputFormatter>? inputFormatters;
  final String hint;
  final String validationText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorTextStyle;
  final TextInputType? keyboardType;
  final int maxLength;
  final ValueSetter<String>? onChanged;
  final TextCapitalization textCapitalization;
  final bool obsecureText;
  final InputStyle inputStyle;
  final Color cursorColor;
  final TextAlign? textAlign;
  final Color? outlineColor;
  final double? borderRadius;
  final Color? hintColor;
  final bool readOnly;
  final Function()? onTap;
  final TextInputAction? textInputAction;
  final ValueSetter<String>? onSubmitted;
  final int? maxLines;
  final int? minLines;
  @override
  State<InputPrimary> createState() => _InputPrimaryState();
}

class _InputPrimaryState extends State<InputPrimary> {
  TextFieldState tState = TextFieldState.none;
  bool isValid = true;
  bool isFocus = false;
  List<TextInputFormatter> formatter = [];

  @override
  void initState() {
    super.initState();
    if (widget.inputFormatters == null) {
      formatter.add(LengthLimitingTextInputFormatter(widget.maxLength));
    } else {
      formatter = widget.inputFormatters!;
      formatter.add(LengthLimitingTextInputFormatter(widget.maxLength));
    }
  }

  _decor() {
    if (widget.inputStyle == InputStyle.box) {
      switch (tState) {
        case TextFieldState.focus:
          return _box(borderColor: AppColor.primaryColor1);
        case TextFieldState.error:
          return _box(borderColor: Colors.red);
        case TextFieldState.none:
          return _box(borderColor: widget.outlineColor ?? Colors.grey.shade300);
        case TextFieldState.disabled:
          return _box(borderColor: widget.outlineColor ?? Colors.grey.shade300);
      }
    } else if (widget.inputStyle == InputStyle.line) {
      switch (tState) {
        case TextFieldState.focus:
          return _line(borderColor: AppColor.primaryColor1);
        case TextFieldState.error:
          return _line(borderColor: Colors.red);
        case TextFieldState.none:
          return _line(
            borderColor: widget.outlineColor ?? Colors.grey.shade300,
          );
        case TextFieldState.disabled:
          return _line(
            borderColor: widget.outlineColor ?? Colors.grey.shade300,
          );
      }
    } else {
      switch (tState) {
        case TextFieldState.focus:
          return _outline(borderColor: AppColor.primaryColor1);
        case TextFieldState.error:
          return _outline(borderColor: Colors.red);
        case TextFieldState.none:
          return _outline(
            borderColor: widget.outlineColor ?? const Color(0xFFCACCCF),
          );
        case TextFieldState.disabled:
          return _outline(borderColor: widget.outlineColor ?? Colors.white);
      }
    }
  }

  _box({required Color borderColor}) {
    return BoxDecoration(
      color: widget.color ?? Colors.white,
      borderRadius: BorderRadius.circular(widget.borderRadius ?? Corners.sm),
      border: Border.all(color: borderColor),
    );
  }

  _outline({required Color borderColor}) {
    return BoxDecoration(
      color: widget.color ?? const Color(0xFFF6F8FB),
      borderRadius: BorderRadius.circular(widget.borderRadius ?? Corners.sm),
      border: Border.all(color: borderColor),
    );
  }

  _line({required Color borderColor, double width = 1}) {
    return BoxDecoration(
      color: widget.color ?? Colors.transparent,
      border: Border(bottom: BorderSide(color: borderColor, width: width)),
    );
  }

  _onFocusChange(bool value) {
    setState(() {
      isFocus = value;
      if (!isValid) {
        tState = TextFieldState.error;
      } else if (value) {
        tState = TextFieldState.focus;
      } else {
        tState = TextFieldState.none;
      }
    });
  }

  _onChanged(String value) async {
    if (widget.validation != null) {
      setState(
        () {
          isValid = widget.validation!(value)!;
          if (!isValid) {
            tState = TextFieldState.error;
          } else {
            if (isFocus) {
              tState = TextFieldState.focus;
            } else {
              tState = TextFieldState.none;
            }
          }
        },
      );
    }
    widget.onChanged?.call(value);
  }

  _contentPadding() {
    if (widget.contentPadding == null) {
      switch (widget.inputStyle) {
        case InputStyle.box:
          return EdgeInsets.symmetric(
            horizontal: Insets.med,
            vertical: Insets.med,
          );
        case InputStyle.line:
          return widget.contentPadding;
        case InputStyle.outline:
          return widget.contentPadding;
      }
    }

    return widget.contentPadding;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: TextStyles.desc.copyWith(color: AppColor.primaryColor1),
          ),
        Container(
          margin: widget.margin ??
              EdgeInsets.symmetric(
                vertical: widget.inputStyle == InputStyle.line ? 0 : Insets.xs,
              ),
          width: Get.width,
          decoration: _decor(),
          child: Padding(
            padding: widget.padding ?? EdgeInsets.zero,
            child: Center(
              child: Focus(
                onFocusChange: _onFocusChange,
                child: TextField(
                  autocorrect: false,
                  minLines: widget.minLines,
                  maxLines: widget.maxLines,
                  onTap: widget.onTap,
                  readOnly: widget.readOnly,
                  enabled: widget.enable,
                  controller: widget.controller,
                  style: widget.textStyle ??
                      TextStyles.text.copyWith(color: widget.textColor),
                  textAlign: widget.textAlign ?? TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: widget.keyboardType ?? TextInputType.text,
                  textCapitalization: widget.textCapitalization,
                  obscureText: widget.obsecureText,
                  decoration: inputDecoration(
                    prefixIcon: widget.prefixIcon,
                    hintText: widget.hint,
                    suffixIcon: widget.suffixIcon,
                    hintStyle: widget.hintStyle,
                    hintColor: widget.hintColor,
                    padding: _contentPadding(),
                  ),
                  cursorColor: widget.cursorColor,
                  onChanged: _onChanged,
                  inputFormatters: formatter,
                  textInputAction: widget.textInputAction,
                  onSubmitted: widget.onSubmitted,
                ),
              ),
            ),
          ),
        ),
        if (!isValid && widget.validationText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: Get.width,
              child: Text(
                widget.validationText,
                style: widget.errorTextStyle ??
                    TextStyles.desc.copyWith(
                      color: Colors.red.shade700,
                    ),
                textAlign: TextAlign.end,
              ),
            ),
          )
      ],
    );
  }
}
