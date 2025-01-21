import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/commands/command.dart';
import 'package:manutencao_carros/config/extensions/buildcontext_extensions.dart';
import 'package:manutencao_carros/config/popup.dart';
import 'package:manutencao_carros/config/routing/routes.dart';
import 'package:manutencao_carros/config/widgets/loading_widget.dart';
import 'package:manutencao_carros/domain/carros/veiculo_model.dart';
import 'package:manutencao_carros/ui/veiculo_manutencao/veiculo_manutencao_viewmodel.dart';
import 'package:manutencao_carros/ui/veiculo_manutencao/widgets/veiculo_manutencao_card.dart';
import 'package:manutencao_carros/ui/veiculo_manutencao/widgets/veiculo_manutencao_popup.dart';

class VeiculoManutencaoScreen extends StatefulWidget {
  final VeiculoManutencaoViewmodel viewModel;
  final int veiculoId;
  const VeiculoManutencaoScreen({
    required this.viewModel,
    required this.veiculoId,
    super.key,
  });

  @override
  State<VeiculoManutencaoScreen> createState() =>
      _VeiculoManutencaoScreenState();
}

class _VeiculoManutencaoScreenState extends State<VeiculoManutencaoScreen> {
  late final CommandArgs<VeiculoModel, int> carregarCommand;
  late final CommandArgs<void, int> excluirCommand;

  void _listenExcluir() async {
    if (excluirCommand.isError) {
      context.showErro(mensagem: excluirCommand.messageError);
    } else if (excluirCommand.isCompleted) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.carroPesquisa, (route) => false);
      await Future.delayed(Duration(milliseconds: 200));
      if (mounted) {
        context.showSucesso(mensagem: "Veículo excluído!");
      }
    }
  }

  @override
  void initState() {
    carregarCommand = widget.viewModel.carregarPorId..execute(widget.veiculoId);

    excluirCommand = widget.viewModel.excluirVeiculo;
    excluirCommand.addListener(_listenExcluir);

    super.initState();
  }

  @override
  void dispose() {
    excluirCommand.removeListener(_listenExcluir);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manutenção de Veículo"),
        actions: [
          VeiculoManutencaoPopup(
            veiculoId: widget.veiculoId,
            onTapAlterarVeiculo: _alterarVeiculo,
            onTapExcluirVeiculo: _confirmaExcluirVeiculo,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListenableBuilder(
          listenable: Listenable.merge([
            carregarCommand,
            excluirCommand,
          ]),
          builder: (_, child) {
            if (excluirCommand.running || carregarCommand.running) {
              return LoadingWidget();
            }

            return child!;
          },
          child: ListenableBuilder(
              listenable: widget.viewModel,
              builder: (_, __) {
                return VeiculoManutencaoCard(
                  veiculoModel: widget.viewModel.veiculoManutencao,
                );
              }),
        ),
      ),
    );
  }

  void _alterarVeiculo(int veiculoId) {
    Navigator.pushNamed(
      context,
      Routes.carroCadastro,
      arguments: veiculoId,
    );
  }

  void _confirmaExcluirVeiculo(int veiculo) {
    showConfimation(
        context: context,
        message: "Deseja realmente excluir esse veículo?",
        onTapYes: () {
          _excluirVeiculo(veiculoId: veiculo);
        });
  }

  void _excluirVeiculo({required int veiculoId}) {
    excluirCommand.execute(veiculoId);
  }
}
