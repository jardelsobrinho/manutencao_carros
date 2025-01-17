import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/widgets/loading_widget.dart';
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
  @override
  void initState() {
    widget.viewModel.carregarPorId.execute(widget.veiculoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manutenção de Veículo"),
        actions: [
          VeiculoManutencaoPopup(
            veiculoId: widget.veiculoId,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListenableBuilder(
          listenable: widget.viewModel.carregarPorId,
          builder: (_, child) {
            if (widget.viewModel.carregarPorId.running) {
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
}
