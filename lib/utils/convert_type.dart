class ConvertType {
  static double toDouble(dynamic value) {
    try {
      return double.parse(value.toString());
    } catch (e) {
      rethrow;
    }
  }
}
