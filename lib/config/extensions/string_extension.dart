extension StringExtension on String {
  double toDouble() {
    if (this == "") {
      return 0.0;
    }

    String value = replaceAll(".", "");
    value = value.replaceAll(",", ".");

    return double.parse(value);
  }

  int toInt() {
    if (this == "") {
      return 0;
    }

    String value = replaceAll(".", "");
    value = value.replaceAll(",", ".");

    return int.parse(value);
  }
}
