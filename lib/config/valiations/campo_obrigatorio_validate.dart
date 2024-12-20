String? campoObrigatorioValidate(String? value) {
  if (value == null || value == "") {
    return "Campo obrigatório";
  }
  return null;
}
