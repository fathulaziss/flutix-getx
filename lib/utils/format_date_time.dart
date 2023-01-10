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
}
