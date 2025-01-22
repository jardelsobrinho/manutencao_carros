import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TipoTextFormField? tipo;
  final String? Function(String? value)? validacao;

  const TextFormFieldCustom({
    super.key,
    required this.label,
    required this.controller,
    this.validacao,
    this.tipo = TipoTextFormField.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
      ),
      controller: controller,
      keyboardType: _retornaKeyboardType(),
      inputFormatters: [
        if (tipo == TipoTextFormField.onlyNumber)
          FilteringTextInputFormatter.digitsOnly
        else if (tipo == TipoTextFormField.decimals)
          DecimalTextInputFormatter()
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (validacao != null) {
          return validacao!(value);
        }
        return null;
      },
    );
  }

  TextInputType? _retornaKeyboardType() {
    switch (tipo) {
      case TipoTextFormField.onlyNumber:
        return TextInputType.number;
      case TipoTextFormField.decimals:
        return TextInputType.numberWithOptions(decimal: true);
      default:
        return null;
    }
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final regExp = RegExp(
        r'^\d*[,]?\d{0,2}$'); // Permite números, uma vírgula e até duas casas decimais

    // Se o novo valor seguir o padrão, retorna o novo valor
    if (regExp.hasMatch(newValue.text)) {
      return newValue;
    }
    // Caso contrário, retorna o valor antigo (não permite mudança inválida)
    return oldValue;
  }
}

enum TipoTextFormField { text, onlyNumber, decimals }
