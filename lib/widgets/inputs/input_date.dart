import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/inputs/input_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InputDate extends StatefulWidget {
  const InputDate({
    super.key,
    this.label,
    this.hint = 'DD-MM-YYYY',
    this.prefixIcon,
    this.suffixIcon,
    this.color,
    this.textColor = AppColor.primaryColor1,
    this.margin,
    this.padding,
    this.enable = true,
    required this.controller,
    this.validation,
    this.inputFormatters,
    this.validationText = '',
    this.textStyle,
    this.hintStyle,
    this.errorTextStyle,
    this.keyboardType,
    this.maxLength = 10,
    required this.value,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.inputStyle = InputStyle.box,
    this.borderRadius = 8,
    this.contentPadding,
    this.dateFormat,
    this.outlineColor,
    this.hintColor,
  });

  final bool? Function(String value)? validation;
  final Color? color;
  final TextEditingController controller;
  final bool enable;
  final TextStyle? errorTextStyle;
  final DateTime? firstDate;
  final String hint;
  final TextStyle? hintStyle;
  final DateTime? initialDate;
  final List<TextInputFormatter>? inputFormatters;
  final InputStyle inputStyle;
  final TextInputType? keyboardType;
  final String? label;
  final DateTime? lastDate;
  final EdgeInsets? margin;
  final int maxLength;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color textColor;
  final TextStyle? textStyle;
  final String validationText;
  final ValueSetter<DateTime> value;
  final double borderRadius;
  final String? dateFormat;
  final Color? outlineColor;
  final Color? hintColor;

  @override
  InputDateState createState() => InputDateState();
}

class InputDateState extends State<InputDate> {
  List<TextInputFormatter> formatter = [];
  bool isFocus = false;
  bool isValid = true;
  TextFieldState tState = TextFieldState.none;

  String _date = '';

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

  Future<void> _selectDate() async {
    final datePicked = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? widget.firstDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      locale: Get.locale,
    );

    if (datePicked != null) {
      setState(() {
        if (widget.dateFormat == null) {
          _date = DateFormat('dd-MM-yyyy').format(datePicked);
        } else {
          _date = DateFormat(widget.dateFormat).format(datePicked);
        }
      });
      widget.controller.text = _date;
      widget.value(datePicked);
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InputPrimary(
      onTap: _selectDate,
      readOnly: true,
      controller: widget.controller,
      hint: widget.hint,
      inputFormatters: formatter,
      keyboardType: TextInputType.number,
      label: widget.label,
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
      contentPadding: widget.contentPadding,
      outlineColor: widget.outlineColor,
      borderRadius: widget.borderRadius,
      hintColor: widget.hintColor,
    );
  }
}
