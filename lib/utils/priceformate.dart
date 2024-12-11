// import 'package:intl/intl.dart';

// // ignore: non_constant_identifier_names
// String PriceFormate(double price) {
//   return NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 2)
//       .format(price);
// }

import 'package:intl/intl.dart';

// ignore: non_constant_identifier_names
String PriceFormate(double price) {
  double roundedPrice = (price * 100).floor() / 100;
  return NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 2,
  ).format(roundedPrice);
}
