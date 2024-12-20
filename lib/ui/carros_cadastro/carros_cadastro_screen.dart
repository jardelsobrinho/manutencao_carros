import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/extensions/buildcontext_extensions.dart';
import 'package:manutencao_carros/config/widgets/loading_widget.dart';
import 'package:manutencao_carros/ui/carros_cadastro/carros_cadastro_viewmodel.dart';
import 'package:manutencao_carros/ui/carros_cadastro/form_carros_cadastro.dart';

class CarrosCadastroScreen extends StatefulWidget {
  final CarrosCadastroViewmodel viewModel;
  const CarrosCadastroScreen({
    super.key,
    required this.viewModel,
  });

  @override
  State<CarrosCadastroScreen> createState() => _CarrosCadastroScreenState();
}

class _CarrosCadastroScreenState extends State<CarrosCadastroScreen> {
  final _nomeController = TextEditingController();
  final _placaController = TextEditingController();
  final _kilometragemController = TextEditingController();

  void _listen() {
    if (widget.viewModel.gravar.isError) {
      context.showErro(mensagem: widget.viewModel.gravar.messageError);
    } else if (widget.viewModel.gravar.idCompleted) {
      context.showSucesso(mensagem: "Dados gravados com sucesso");
    }
  }

  @override
  void initState() {
    super.initState();
    widget.viewModel.gravar.addListener(_listen);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _placaController.dispose();
    _kilometragemController.dispose();

    widget.viewModel.gravar.removeListener(_listen);
    widget.viewModel.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Carro"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var dados = ParamsGravaCarro(
              nome: _nomeController.text,
              placa: _placaController.text,
              kilometragem: _kilometragemController.text,
            );

            await widget.viewModel.gravar.execute(dados);
          }
        },
        label: Text("Gravar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListenableBuilder(
          listenable: widget.viewModel.gravar,
          builder: (_, child) {
            if (widget.viewModel.gravar.running) {
              return LoadingWidget();
            }

            return child!;
          },
          child: FormCarrosCadastro(
            nomeController: _nomeController,
            placaController: _placaController,
            kilometragemController: _kilometragemController,
            viewModel: widget.viewModel,
            formKey: _formKey,
          ),
        ),
      ),
    );
  }
}
