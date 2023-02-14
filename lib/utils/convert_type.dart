class ConvertType {
  static double toDouble(dynamic value) {
    try {
      return double.parse(value.toString());
    } catch (e) {
      rethrow;
    }
  }

  static int toInt(String value) {
    if (value.isEmpty) {
      return 0;
    } else {
      try {
        return int.parse(
          value,
        );
      } catch (e) {
        rethrow;
      }
    }
  }
}
