import 'dart:async';

import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class InputSearchDropdown extends StatefulWidget {
  const InputSearchDropdown({
    super.key,
    required this.controller,
    required this.itemBuilder,
    required this.onSelected,
    required this.suggestionsCallback,
    this.hint = 'Search',
    this.label,
    this.textStyle,
    this.hintStyle,
    this.textColor = AppColor.primaryColor1,
    this.hintColor = const Color(0xFFC1BABA),
    this.prefixIcon,
    this.suffixIcon,
    this.inputStyle = InputStyle.box,
    this.color,
    this.outlineColor,
    this.borderRadius,
  });

  final TextEditingController controller;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  final void Function(dynamic)? onSelected;
  final FutureOr<List<dynamic>> Function(String) suggestionsCallback;
  final String? label;
  final String hint;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color textColor;
  final Color hintColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputStyle inputStyle;
  final Color? outlineColor;
  final Color? color;
  final double? borderRadius;

  @override
  State<InputSearchDropdown> createState() => _InputSearchDropdownState();
}

class _InputSearchDropdownState extends State<InputSearchDropdown> {
  TextFieldState tState = TextFieldState.none;
  bool isFocus = false;
  bool isValid = true;

  dynamic _decor() {
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

  BoxDecoration _box({required Color borderColor}) {
    return BoxDecoration(
      color: widget.color ?? Colors.white,
      borderRadius: BorderRadius.circular(widget.borderRadius ?? Corners.lg),
      border: Border.all(color: borderColor),
    );
  }

  BoxDecoration _outline({required Color borderColor}) {
    return BoxDecoration(
      color: widget.color ?? const Color(0xFFF6F8FB),
      borderRadius: BorderRadius.circular(widget.borderRadius ?? Corners.lg),
      border: Border.all(color: borderColor),
    );
  }

  BoxDecoration _line({required Color borderColor, double width = 1}) {
    return BoxDecoration(
      color: widget.color ?? Colors.transparent,
      border: Border(bottom: BorderSide(color: borderColor, width: width)),
    );
  }

  void _onFocusChange(bool value) {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) Text(widget.label!, style: TextStyles.text),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: widget.inputStyle == InputStyle.line ? 0 : Insets.sm,
          ),
          decoration: _decor(),
          child: Focus(
            onFocusChange: _onFocusChange,
            child: TypeAheadField(
              builder: (context, controller, focusNode) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  style: widget.textStyle ??
                      TextStyles.text.copyWith(color: widget.textColor),
                  decoration: inputDecoration(
                    prefixIcon: widget.prefixIcon,
                    hintText: widget.hint,
                    suffixIcon: widget.suffixIcon,
                    hintStyle: widget.hintStyle,
                    hintColor: widget.hintColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: Insets.med,
                      vertical: Insets.med,
                    ),
                  ),
                );
              },
              controller: widget.controller,
              itemBuilder: widget.itemBuilder,
              onSelected: widget.onSelected,
              suggestionsCallback: (search) {
                return widget.suggestionsCallback(search);
              },
              emptyBuilder: (context) {
                return const SizedBox();
              },
              decorationBuilder: (context, child) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width / 2,
                    maxHeight: MediaQuery.of(context).size.width / 2,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor1,
                      boxShadow: [
                        BoxShadow(color: Colors.transparent),
                      ],
                    ),
                    child: child,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
