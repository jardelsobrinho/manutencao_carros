String? campoMaiorQueZeroValidate(String? value) {
  if (value == null || value == "") {
    return "Campo obrigatório";
  }

  if (int.parse(value) <= 0) {
    return "Deve ser maior que zero";
  }

  return null;
}
