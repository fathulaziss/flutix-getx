import 'package:intl/intl.dart';

String priceFormat(dynamic price) {
  return NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'IDR ',
    decimalDigits: 0,
  ).format(price);
}

String priceFormatWithoutSymbol(dynamic price) {
  return NumberFormat.currency(
    locale: 'id_ID',
    symbol: '',
    decimalDigits: 0,
  ).format(price);
}
