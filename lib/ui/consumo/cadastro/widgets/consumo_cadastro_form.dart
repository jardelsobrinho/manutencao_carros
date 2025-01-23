import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/valiations/campo_maior_que_zero_decimal_validate.dart';
import 'package:manutencao_carros/config/widgets/card_widget.dart';
import 'package:manutencao_carros/config/widgets/textformfield_custom.dart';
import 'package:manutencao_carros/ui/consumo/cadastro/consumo_cadastro_viewmodel.dart';

class ConsumoCadastroForm extends StatelessWidget {
  final TextEditingController litrosController;
  final TextEditingController precoTotalController;
  final TextEditingController kilometragemAtualController;
  final ConsumoCadastroViewmodel viewModel;
  final GlobalKey<FormState> formKey;

  const ConsumoCadastroForm({
    super.key,
    required this.litrosController,
    required this.precoTotalController,
    required this.kilometragemAtualController,
    required this.viewModel,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CardWidget(
        spacing: 12,
        children: [
          TextFormFieldCustom(
            label: "Litros",
            controller: litrosController,
            tipo: TipoTextFormField.decimals,
            validacao: (value) => campoMaiorQueZeroDecimalValidate(value),
          ),
          TextFormFieldCustom(
            label: "Preço Total",
            controller: precoTotalController,
            tipo: TipoTextFormField.decimals,
            validacao: (value) => campoMaiorQueZeroDecimalValidate(value),
          ),
          TextFormFieldCustom(
            label: "Kilometragem Atual",
            controller: kilometragemAtualController,
            tipo: TipoTextFormField.decimals,
            validacao: (value) => campoMaiorQueZeroDecimalValidate(value),
          ),
        ],
      ),
    );
  }
}
