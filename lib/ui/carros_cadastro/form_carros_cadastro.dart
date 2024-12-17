import 'package:flutter/material.dart';

class FormCarrosCadastro extends StatelessWidget {
  final TextEditingController nomeController;
  final TextEditingController placaController;
  final TextEditingController kilometragemController;

  const FormCarrosCadastro({
    super.key,
    required this.nomeController,
    required this.placaController,
    required this.kilometragemController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: "Nome"),
          controller: nomeController,
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: "Placa"),
          controller: placaController,
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: "Kilometragem Inicial"),
          controller: kilometragemController,
        ),
      ],
    );
  }
}
