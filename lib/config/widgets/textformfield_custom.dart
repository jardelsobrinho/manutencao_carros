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
      keyboardType: TextInputType.number,
      inputFormatters: [
        if (tipo == TipoTextFormField.onlyNumber)
          FilteringTextInputFormatter.digitsOnly
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
}

enum TipoTextFormField { text, onlyNumber }
