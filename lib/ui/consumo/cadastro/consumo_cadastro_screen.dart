import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/commands/command.dart';
import 'package:manutencao_carros/config/extensions/buildcontext_extension.dart';
import 'package:manutencao_carros/config/extensions/double_extension.dart';
import 'package:manutencao_carros/config/widgets/loading_widget.dart';
import 'package:manutencao_carros/domain/consumo_veiculo/consumo_veiculo_model.dart';
import 'package:manutencao_carros/ui/consumo/cadastro/consumo_cadastro_viewmodel.dart';
import 'package:manutencao_carros/ui/consumo/cadastro/widgets/consumo_cadastro_form.dart';

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
  late final CommandArgs<ConsumoVeiculoModel, int> _carregarDadosCommand;
  late final CommandArgs<void, ParamsGravaConsumo> _gravarCommand;

  final _formKey = GlobalKey<FormState>();

  final _litrosController = TextEditingController();
  final _precoTotalController = TextEditingController();
  final _kilometragemAtualController = TextEditingController();

  void _listenGravar() async {
    if (_gravarCommand.isError) {
      context.showErro(mensagem: _gravarCommand.messageError);
    } else if (_gravarCommand.isCompleted) {
      context.pop(result: true);
    }
  }

  void _listenCarregarDados() async {
    if (_carregarDadosCommand.isError) {
      context.showErro(mensagem: _carregarDadosCommand.messageError);
    } else if (_carregarDadosCommand.isCompleted) {
      _litrosController.text = widget.viewModel.veiculo.litros.format();
      _precoTotalController.text = widget.viewModel.veiculo.precoTotal.format();
      _kilometragemAtualController.text =
          widget.viewModel.veiculo.kilometragem.toString();
    }
  }

  @override
  void initState() {
    super.initState();

    _carregarDadosCommand = widget.viewModel.carregaDados;
    _gravarCommand = widget.viewModel.gravar;

    _carregarDadosCommand.addListener(_listenCarregarDados);
    _gravarCommand.addListener(_listenGravar);
  }

  @override
  void dispose() {
    _litrosController.dispose();
    _precoTotalController.dispose();
    _kilometragemAtualController.dispose();

    _carregarDadosCommand.removeListener(_listenCarregarDados);
    _gravarCommand.removeListener(_listenGravar);
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
          if (_formKey.currentState!.validate()) {
            var dados = ParamsGravaConsumo(
              id: widget.arguments.consumoId,
              litros: _litrosController.text,
              precoTotal: _precoTotalController.text,
              kilometragem: _kilometragemAtualController.text,
              veiculoId: widget.arguments.veiculoId,
            );

            await _gravarCommand.execute(dados);
          }
        },
        label: Text("Gravar"),
        icon: Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListenableBuilder(
          listenable: Listenable.merge([
            _gravarCommand,
            _carregarDadosCommand,
          ]),
          builder: (_, child) {
            if (_gravarCommand.running || _carregarDadosCommand.running) {
              return LoadingWidget();
            }

            return child!;
          },
          child: ConsumoCadastroForm(
            litrosController: _litrosController,
            precoTotalController: _precoTotalController,
            kilometragemAtualController: _kilometragemAtualController,
            viewModel: widget.viewModel,
            formKey: _formKey,
          ),
        ),
      ),
    );
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
