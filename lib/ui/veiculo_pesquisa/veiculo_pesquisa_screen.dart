import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manutencao_carros/config/extensions/buildcontext_extensions.dart';
import 'package:manutencao_carros/config/routing/routes.dart';
import 'package:manutencao_carros/config/widgets/loading_widget.dart';
import 'package:manutencao_carros/ui/veiculo_pesquisa/veiculo_pesquisa_viewmodel.dart';
import 'package:manutencao_carros/ui/veiculo_pesquisa/widgets/veiculo_pesquisa_item.dart';

class VeiculoPesquisaScreen extends StatefulWidget {
  final VeiculoPesquisaViewModel viewModel;
  const VeiculoPesquisaScreen({
    super.key,
    required this.viewModel,
  });

  @override
  State<VeiculoPesquisaScreen> createState() => _VeiculoPesquisaScreenState();
}

class _VeiculoPesquisaScreenState extends State<VeiculoPesquisaScreen> {
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
                  itemCount: widget.viewModel.listaVeiculos.length,
                  itemBuilder: (context, index) {
                    final carro = widget.viewModel.listaVeiculos[index];
                    return VeiculoPesquisaItem(
                      onTap: () =>
                          onIrParaVeiculoManutencao(veiculoId: carro.id!),
                      veiculoModel: carro,
                    );
                  },
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => onNovoVeiculo(),
        label: Text("Veículo"),
        icon: Icon(Icons.add),
      ),
    );
  }

  void onNovoVeiculo() async {
    final result = await context.push("${Routes.carroCadastro}/1");
    if (result == true) {
      await Future.delayed(Duration(milliseconds: 300));
      if (mounted) context.showSucesso(mensagem: "Veículo gravado!");
    }
  }

  void onIrParaVeiculoManutencao({required int veiculoId}) {
    context.push("${Routes.carroManutencao}/$veiculoId");
  }
}
