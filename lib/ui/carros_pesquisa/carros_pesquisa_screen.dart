import 'package:flutter/material.dart';
import 'package:manutencao_carros/ui/carros_pesquisa/carros_pesquisa_viewmodel.dart';

class CarrosPesquisaScreen extends StatefulWidget {
  final CarrosPesquisaViewModel viewModel;
  const CarrosPesquisaScreen({
    super.key,
    required this.viewModel,
  });

  @override
  State<CarrosPesquisaScreen> createState() => _CarrosPesquisaScreenState();
}

class _CarrosPesquisaScreenState extends State<CarrosPesquisaScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Carros Pesquisa"),
      ),
    );
  }
}
