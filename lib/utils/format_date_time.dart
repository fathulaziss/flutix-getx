import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormatDateTime {
  static String format({
    required DateTime value,
    DateFormat? format,
  }) {
    format ??= DateFormat('yyyy-MM-dd');
    try {
      return format.format(value);
    } catch (e) {
      return 'Invalid date';
    }
  }

  static String shortDayName(DateTime value) {
    switch (value.weekday) {
      case 1:
        return 'mondayShort'.tr;
      case 2:
        return 'tuesdayShort'.tr;
      case 3:
        return 'wednesdayShort'.tr;
      case 4:
        return 'thursdayShort'.tr;
      case 5:
        return 'fridayShort'.tr;
      case 6:
        return 'saturdayShort'.tr;
      default:
        return 'sundayShort'.tr;
    }
  }
}
