import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/inputs/input_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({
    super.key,
    this.label,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.color,
    this.textColor = AppColor.primaryColor1,
    this.margin,
    this.padding,
    this.enable = true,
    this.validation,
    this.inputFormatters,
    this.hint = 'Type Here...',
    this.validationText = '',
    this.textStyle,
    this.hintStyle,
    this.errorTextStyle,
    this.maxLength = 50,
    this.value,
    this.inputStyle = InputStyle.box,
    this.textCapitalization = TextCapitalization.none,
    this.contentPadding,
    this.textAlign,
    this.outlineColor,
    this.borderRadius,
    this.hintColor,
  });

  final String? label;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? color;
  final Color textColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool enable;
  final bool? Function(String value)? validation;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final String hint;
  final String validationText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorTextStyle;
  final int maxLength;
  final ValueSetter<String>? value;
  final InputStyle inputStyle;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final Color? outlineColor;
  final double? borderRadius;
  final Color? hintColor;

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  bool? Function(String value)? validation;
  String validateText = '';

  @override
  void initState() {
    super.initState();
    if (widget.validation == null) {
      validation = GetUtils.isEmail;
    } else {
      validation = widget.validation;
    }

    if (widget.validationText.isEmpty) {
      validateText = 'Invalid email';
    } else {
      validateText = widget.validationText;
    }
  }

  void _onChanged(String value) {
    widget.value?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return InputPrimary(
      label: widget.label,
      controller: widget.controller,
      hint: widget.hint,
      inputFormatters: widget.inputFormatters,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: widget.textCapitalization,
      inputStyle: widget.inputStyle,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      color: widget.color,
      textColor: widget.textColor,
      margin: widget.margin,
      padding: widget.padding,
      enable: widget.enable,
      validation: validation,
      validationText: validateText,
      textStyle: widget.textStyle,
      hintStyle: widget.hintStyle,
      errorTextStyle: widget.errorTextStyle,
      maxLength: widget.maxLength,
      onChanged: _onChanged,
      textAlign: widget.textAlign ?? TextAlign.left,
      outlineColor: widget.outlineColor,
      borderRadius: widget.borderRadius,
      hintColor: widget.hintColor,
    );
  }
}
