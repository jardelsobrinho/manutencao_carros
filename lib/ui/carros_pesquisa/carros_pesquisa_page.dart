import 'package:flutter/material.dart';
import 'package:manutencao_carros/ui/carros_pesquisa/carros_pesquisa_viewmodel.dart';

class CarrosPesquisaPage extends StatefulWidget {
  final CarrosPesquisaViewModel viewModel;
  const CarrosPesquisaPage({
    super.key,
    required this.viewModel,
  });

  @override
  State<CarrosPesquisaPage> createState() => _CarrosPesquisaPageState();
}

class _CarrosPesquisaPageState extends State<CarrosPesquisaPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Carros Pesquisa"),
      ),
    );
  }
}
