import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/valiations/campo_maior_que_zero_validate.dart';
import 'package:manutencao_carros/config/valiations/campo_obrigatorio_validate.dart';
import 'package:manutencao_carros/config/widgets/card_widget.dart';
import 'package:manutencao_carros/config/widgets/textformfield_custom.dart';
import 'package:manutencao_carros/ui/veiculo/cadastro/veiculo_cadastro_viewmodel.dart';

class VeiculoCadastroForm extends StatelessWidget {
  final TextEditingController nomeController;
  final TextEditingController placaController;
  final TextEditingController kilometragemController;
  final VeiculoCadastroViewmodel viewModel;
  final GlobalKey<FormState> formKey;

  const VeiculoCadastroForm({
    super.key,
    required this.nomeController,
    required this.placaController,
    required this.kilometragemController,
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
            label: "Nome",
            controller: nomeController,
            validacao: (value) => campoObrigatorioValidate(value),
          ),
          TextFormFieldCustom(
            label: "Placa",
            controller: placaController,
            validacao: (value) => campoObrigatorioValidate(value),
          ),
          TextFormFieldCustom(
            label: "Kilometragem",
            controller: kilometragemController,
            tipo: TipoTextFormField.onlyNumber,
            validacao: (value) => campoMaiorQueZeroValidate(value),
          ),
        ],
      ),
    );
  }
}
