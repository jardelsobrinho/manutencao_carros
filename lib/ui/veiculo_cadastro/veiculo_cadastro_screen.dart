import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/commands/command.dart';
import 'package:manutencao_carros/config/extensions/buildcontext_extensions.dart';
import 'package:manutencao_carros/config/widgets/loading_widget.dart';
import 'package:manutencao_carros/domain/carros/veiculo_model.dart';
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
  late final CommandArgs<void, ParamsGravaCarro> gravarCommand;
  late final CommandArgs<VeiculoModel, int> carregaDadosCommand;

  final _nomeController = TextEditingController();
  final _placaController = TextEditingController();
  final _kilometragemController = TextEditingController();

  void _listenGravar() async {
    if (gravarCommand.isError) {
      context.showErro(mensagem: gravarCommand.messageError);
    } else if (gravarCommand.isCompleted) {
      context.pop(result: true);
    }
  }

  void _listenCarregarDados() async {
    if (carregaDadosCommand.isError) {
      context.showErro(mensagem: carregaDadosCommand.messageError);
    } else if (carregaDadosCommand.isCompleted) {
      _nomeController.text = widget.viewModel.veiculo.nome;
      _placaController.text = widget.viewModel.veiculo.placa;
      _kilometragemController.text =
          widget.viewModel.veiculo.kilometragem.toString();
    }
  }

  @override
  void initState() {
    super.initState();

    gravarCommand = widget.viewModel.gravar;
    carregaDadosCommand = widget.viewModel.carregaDados;

    _nomeController.text = "";
    _placaController.text = "";
    _kilometragemController.text = "";

    if (widget.veiculoId > 0) {
      carregaDadosCommand.execute(widget.veiculoId);
    }

    gravarCommand.addListener(_listenGravar);
    carregaDadosCommand.addListener(_listenCarregarDados);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _placaController.dispose();
    _kilometragemController.dispose();

    gravarCommand.removeListener(_listenGravar);
    carregaDadosCommand.removeListener(_listenCarregarDados);
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

            await gravarCommand.execute(dados);
          }
        },
        label: Text("Gravar"),
        icon: Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListenableBuilder(
          listenable: Listenable.merge([
            gravarCommand,
            carregaDadosCommand,
          ]),
          builder: (_, child) {
            if (gravarCommand.running || carregaDadosCommand.running) {
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
