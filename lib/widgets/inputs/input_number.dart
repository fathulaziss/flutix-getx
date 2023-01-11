import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/inputs/input_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputNumber extends StatefulWidget {
  const InputNumber({
    Key? key,
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
    this.contentPadding,
    this.textAlign,
    this.outlineColor,
    this.borderRadius,
    this.hintColor,
  }) : super(key: key);

  final String? label;
  final bool? Function(String value)? validation;
  final Color? color;
  final TextEditingController? controller;
  final bool enable;
  final TextStyle? errorTextStyle;
  final String hint;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final InputStyle inputStyle;
  final EdgeInsets? margin;
  final int maxLength;
  final EdgeInsets? padding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color textColor;
  final TextStyle? textStyle;
  final String validationText;
  final ValueSetter<int>? value;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final Color? outlineColor;
  final double? borderRadius;
  final Color? hintColor;

  @override
  State<InputNumber> createState() => _InputNumberState();
}

class _InputNumberState extends State<InputNumber> {
  List<TextInputFormatter> formatter = [];

  @override
  void initState() {
    super.initState();
    if (widget.inputFormatters == null) {
      formatter.add(FilteringTextInputFormatter.digitsOnly);
    } else {
      formatter = widget.inputFormatters!;
      formatter.add(FilteringTextInputFormatter.digitsOnly);
    }
  }

  _onChanged(String value) {
    if (widget.value != null) {
      widget.value?.call(int.tryParse(value) ?? 0);
      // widget.value!(int.tryParse(value) ?? 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InputPrimary(
      label: widget.label,
      controller: widget.controller,
      hint: widget.hint,
      inputFormatters: formatter,
      keyboardType: TextInputType.number,
      inputStyle: widget.inputStyle,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      color: widget.color,
      textColor: widget.textColor,
      margin: widget.margin,
      padding: widget.padding,
      enable: widget.enable,
      validation: widget.validation,
      validationText: widget.validationText,
      textStyle: widget.textStyle,
      hintStyle: widget.hintStyle,
      errorTextStyle: widget.errorTextStyle,
      maxLength: widget.maxLength,
      onChanged: _onChanged,
      contentPadding: widget.contentPadding,
      textAlign: widget.textAlign ?? TextAlign.left,
      outlineColor: widget.outlineColor,
      borderRadius: widget.borderRadius,
      hintColor: widget.hintColor,
    );
  }
}
