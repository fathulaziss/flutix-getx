import 'dart:convert';
import 'dart:developer' as d;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppUtils {
  static dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return 'Versi ${packageInfo.version}';
  }

  static Future<bool> checkIsJailBroken() async {
    if (kReleaseMode) {
      final b = await FlutterJailbreakDetection.jailbroken;
      return b;
    }
    return false;
  }

  static Future<bool> checkTokenValidity(String token) async {
    try {
      return !JwtDecoder.isExpired(token);
    } catch (e) {
      logSys(e.toString());
      return false;
    }
  }

  static bool isJsonSting(String s) {
    try {
      json.decode(s) as Map<String, dynamic>;
      return true;
    } on FormatException {
      return false;
    }
  }

  static void generateColorSwatch(Color color) {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};
    final r = color.red;
    final g = color.green;
    final b = color.blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    logSys('cek result : $swatch');
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = '.'; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Short-circuit if the new value is empty
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    final oldValueText = oldValue.text.replaceAll(separator, '');
    var newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      final selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      var newString = '';
      for (var i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
          newString = separator + newString;
        }
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}

logSys(String s) {
  if (kDebugMode) {
    d.log(s);
  }
}
