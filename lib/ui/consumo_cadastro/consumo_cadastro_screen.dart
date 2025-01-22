import 'package:flutter/material.dart';
import 'package:manutencao_carros/ui/consumo_cadastro/consumo_cadastro_viewmodel.dart';
import 'package:manutencao_carros/ui/consumo_cadastro/widgets/consumo_cadastro_form.dart';

class ConsumoCadastroScreen extends StatefulWidget {
  final ConsumoCadastroArguments arguments;
  final ConsumoCadastroViewmodel viewModel;
  const ConsumoCadastroScreen({
    required this.arguments,
    required this.viewModel,
    super.key,
  });

  @override
  State<ConsumoCadastroScreen> createState() => _ConsumoCadastroScreenState();
}

class _ConsumoCadastroScreenState extends State<ConsumoCadastroScreen> {
  final _formKey = GlobalKey<FormState>();

  final _litrosController = TextEditingController();
  final _precoTotalController = TextEditingController();
  final _kilometragemAtualController = TextEditingController();

  @override
  void dispose() {
    _litrosController.dispose();
    _precoTotalController.dispose();
    _kilometragemAtualController.dispose();

    //gravarCommand.removeListener(_listenGravar);
    //carregaDadosCommand.removeListener(_listenCarregarDados);
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: widget.arguments.consumoId > 0
              ? Text("Alterar Consumo")
              : Text("Novo Consumo"),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {}
          },
          label: Text("Gravar"),
          icon: Icon(Icons.save),
        ),
        body: ConsumoCadastroForm(
          litrosController: _litrosController,
          precoTotalController: _precoTotalController,
          kilometragemAtualController: _kilometragemAtualController,
          viewModel: widget.viewModel,
          formKey: _formKey,
        ));
  }
}

class ConsumoCadastroArguments {
  final int veiculoId;
  final int consumoId;

  ConsumoCadastroArguments({
    required this.veiculoId,
    required this.consumoId,
  });
}
