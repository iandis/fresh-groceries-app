import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

@internal
final NumberFormat idrFormatter = NumberFormat.currency(
  locale: 'id_ID',
  symbol: 'Rp ',
  decimalDigits: 0,
);

extension StringPriceFormatExtension on int {
  String get inIDR {
    return idrFormatter.format(this);
  }
}
