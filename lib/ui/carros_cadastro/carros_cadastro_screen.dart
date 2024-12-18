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
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController placaController = TextEditingController();
  final TextEditingController kilometragemController = TextEditingController();

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
    widget.viewModel.gravar.removeListener(_listen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Carro"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          var dados = DadosCadastroCarro(
            nome: nomeController.text,
            placa: placaController.text,
            kilometragem: kilometragemController.text,
          );

          widget.viewModel.gravar.execute(dados);
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
            nomeController: nomeController,
            placaController: placaController,
            kilometragemController: kilometragemController,
          ),
        ),
      ),
    );
  }
}
