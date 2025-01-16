import 'package:flutter/material.dart';
import 'package:manutencao_carros/ui/veiculo_manutencao/veiculo_manutencao_viewmodel.dart';

class VeiculoManutencaoScreen extends StatefulWidget {
  final VeiculoManutencaoViewmodel viewModel;
  const VeiculoManutencaoScreen({
    required this.viewModel,
    super.key,
  });

  @override
  State<VeiculoManutencaoScreen> createState() =>
      _VeiculoManutencaoScreenState();
}

class _VeiculoManutencaoScreenState extends State<VeiculoManutencaoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manutenção de Veículo"),
      ),
      body: Text("Ola Mundo"),
    );
  }
}
