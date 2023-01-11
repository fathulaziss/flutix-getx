import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/regex.dart';
import 'package:flutix/widgets/inputs/input_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({
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
    this.hint = 'Password',
    this.validationText,
    this.textStyle,
    this.hintStyle,
    this.errorTextStyle,
    this.keyboardType,
    this.maxLength = 50,
    this.value,
    this.inputStyle = InputStyle.box,
    this.iconColor,
    this.cursorColor = AppColor.primaryColor1,
    this.contentPadding,
    this.textAlign,
    this.outlineColor,
    this.borderRadius,
    this.hintColor,
  }) : super(key: key);

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
  final String hint;
  final String? validationText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorTextStyle;
  final TextInputType? keyboardType;
  final int maxLength;
  final ValueSetter<String>? value;
  final InputStyle inputStyle;
  final Color? iconColor;
  final Color cursorColor;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final Color? outlineColor;
  final double? borderRadius;
  final Color? hintColor;
  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool? Function(String value)? validation;
  String validateText = '';
  bool obsecureText = true;

  @override
  void initState() {
    super.initState();
    if (widget.validation == null) {
      validation = (value) {
        return isValidPassword(password: value);
      };
    } else {
      validation = widget.validation;
    }

    if (widget.validationText == null) {
      validateText = '- Password minimal 6 karakter\n';
      // +          '- Password kombinasi huruf & angka\n';
    } else {
      validateText = widget.validationText!;
    }
  }

  _onChanged(String value) {
    if (widget.value != null) {
      widget.value?.call(value);
      // widget.value!(value);
    }
  }

  _toggleVisible() {
    setState(() {
      obsecureText = !obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InputPrimary(
      label: widget.label,
      controller: widget.controller,
      hint: widget.hint,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType ?? TextInputType.visiblePassword,
      inputStyle: widget.inputStyle,
      prefixIcon: widget.prefixIcon,
      suffixIcon: InkWell(
        onTap: _toggleVisible,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            !obsecureText ? Icons.visibility : Icons.visibility_off,
            color: widget.iconColor ?? Theme.of(context).primaryColor,
          ),
        ),
      ),
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
      obsecureText: obsecureText,
      cursorColor: widget.cursorColor,
      contentPadding: widget.contentPadding,
      textAlign: widget.textAlign ?? TextAlign.left,
      outlineColor: widget.outlineColor,
      borderRadius: widget.borderRadius,
      hintColor: widget.hintColor,
      maxLines: 1,
    );
  }
}
