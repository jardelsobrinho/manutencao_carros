String? campoMaiorQueZeroDecimalValidate(String? value) {
  if (value == null || value == "") {
    return "Campo obrigatório";
  }

  var newValue = value.replaceAll(',', '.');

  if (double.parse(newValue) <= 0) {
    return "Deve ser maior que zero";
  }

  return null;
}
