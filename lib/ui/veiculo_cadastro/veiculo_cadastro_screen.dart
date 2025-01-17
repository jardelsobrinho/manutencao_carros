import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manutencao_carros/config/extensions/buildcontext_extensions.dart';
import 'package:manutencao_carros/config/widgets/loading_widget.dart';
import 'package:manutencao_carros/ui/veiculo_cadastro/veiculo_cadastro_viewmodel.dart';
import 'package:manutencao_carros/ui/veiculo_cadastro/widgets/veiculo_cadastro_form.dart';

class VeiculoCadastroScreen extends StatefulWidget {
  final VeiculoCadastroViewmodel viewModel;
  final int veiculoId;
  const VeiculoCadastroScreen({
    super.key,
    required this.veiculoId,
    required this.viewModel,
  });

  @override
  State<VeiculoCadastroScreen> createState() => _VeiculoCadastroScreenState();
}

class _VeiculoCadastroScreenState extends State<VeiculoCadastroScreen> {
  final _nomeController = TextEditingController();
  final _placaController = TextEditingController();
  final _kilometragemController = TextEditingController();

  void _listenGravar() async {
    if (widget.viewModel.gravar.isError) {
      context.showErro(mensagem: widget.viewModel.gravar.messageError);
    } else if (widget.viewModel.gravar.isCompleted) {
      context.pop(true);
    }
  }

  void _listenCarregarDados() async {
    if (widget.viewModel.carregaDados.isError) {
      context.showErro(mensagem: widget.viewModel.carregaDados.messageError);
    }
  }

  @override
  void initState() {
    super.initState();

    _nomeController.text = "";
    _placaController.text = "";
    _kilometragemController.text = "";

    if (widget.veiculoId > 0) {
      widget.viewModel.carregaDados.execute();
    }

    widget.viewModel.gravar.addListener(_listenGravar);
    widget.viewModel.carregaDados.addListener(_listenCarregarDados);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _placaController.dispose();
    _kilometragemController.dispose();

    widget.viewModel.gravar.removeListener(_listenGravar);
    widget.viewModel.carregaDados.removeListener(_listenCarregarDados);
    widget.viewModel.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.veiculoId == 0
            ? Text("Novo de Veículo")
            : Text("Edição de Veículo"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var dados = ParamsGravaCarro(
              id: widget.veiculoId,
              nome: _nomeController.text,
              placa: _placaController.text,
              kilometragem: _kilometragemController.text,
            );

            await widget.viewModel.gravar.execute(dados);
          }
        },
        label: Text("Gravar"),
        icon: Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListenableBuilder(
          listenable: Listenable.merge([
            widget.viewModel.gravar,
            widget.viewModel.carregaDados,
          ]),
          builder: (_, child) {
            if (widget.viewModel.gravar.running ||
                widget.viewModel.carregaDados.running) {
              return LoadingWidget();
            }

            return child!;
          },
          child: VeiculoCadastroForm(
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
