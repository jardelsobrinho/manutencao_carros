import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/widgets/loading_widget.dart';
import 'package:manutencao_carros/config/widgets/textfield_widget.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListenableBuilder(
          listenable: widget.viewModel.pesquisar,
          builder: (_, child) {
            if (widget.viewModel.pesquisar.running) {
              return LoadingWidget();
            }

            return child!;
          },
          child: ListenableBuilder(
              listenable: widget.viewModel,
              builder: (context, child) {
                return ListView.builder(
                  itemCount: widget.viewModel.listaCarros.length,
                  itemBuilder: (context, index) {
                    final carro = widget.viewModel.listaCarros[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFieldWidget(
                                    label: "Nome", value: carro.nome),
                                Text("Placa"),
                                Text(
                                  carro.placa,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text("Kilometragem"),
                            Text(
                              "${carro.kilometragem} km",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
