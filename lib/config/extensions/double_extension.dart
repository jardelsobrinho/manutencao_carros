import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String format() {
    var formatter = NumberFormat.decimalPattern('pt_BR');

    String value = formatter.format(this);
    value = value.replaceAll(".", "");
    return value;
  }
}
