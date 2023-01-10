import 'dart:convert';

import 'package:colored_json/colored_json.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ApiLogTextCopy extends StatelessWidget {
  const ApiLogTextCopy({
    Key? key,
    required this.text,
    this.style,
  }) : super(key: key);

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    var textJson = '';
    final b = AppUtils.isJsonSting(text);
    if (b) {
      final t = jsonDecode(text) as Map<String, dynamic>..remove('data');

      textJson = jsonEncode(t);
    }
    return InkWell(
      onLongPress: () async {
        await Clipboard.setData(ClipboardData(text: text));
        Get.snackbar(
          '',
          'Copied to Clipboard',
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.GROUNDED,
          titleText: const SizedBox(),
          duration: const Duration(milliseconds: 1500),
        );
      },
      child: b
          ? ColoredJson(
              data: textJson,
              keyColor: Colors.black,
              stringColor: Colors.green.shade600,
              textStyle: style ?? TextStyles.text,
            )
          : Text(
              text,
              style: style ?? TextStyles.text,
            ),
    );
  }
}
