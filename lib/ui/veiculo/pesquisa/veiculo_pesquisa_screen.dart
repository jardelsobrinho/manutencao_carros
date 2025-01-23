import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/commands/command.dart';
import 'package:manutencao_carros/config/extensions/buildcontext_extension.dart';
import 'package:manutencao_carros/config/routing/routes.dart';
import 'package:manutencao_carros/config/widgets/loading_widget.dart';
import 'package:manutencao_carros/ui/veiculo/pesquisa/veiculo_pesquisa_viewmodel.dart';
import 'package:manutencao_carros/ui/veiculo/pesquisa/widgets/veiculo_pesquisa_item.dart';

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
  late final Command<void> pesquisaCommand;

  @override
  void initState() {
    pesquisaCommand = widget.viewModel.pesquisar;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListenableBuilder(
          listenable: pesquisaCommand,
          builder: (_, child) {
            if (pesquisaCommand.running) {
              return LoadingWidget();
            }
            return child!;
          },
          child: ListenableBuilder(
              listenable: widget.viewModel,
              builder: (context, child) {
                return ListView.builder(
                  itemCount: widget.viewModel.listaVeiculos.length,
                  padding: EdgeInsets.only(bottom: 60),
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
    final result = await context.pushNamed(
      route: Routes.carroCadastro,
      arguments: 0,
    );

    if (result == true) {
      await Future.delayed(Duration(milliseconds: 200));
      if (mounted) context.showSucesso(mensagem: "Veículo gravado!");
    }
  }

  void onIrParaVeiculoManutencao({required int veiculoId}) async {
    await context.pushNamed(
      route: Routes.carroManutencao,
      arguments: veiculoId,
    );

    pesquisaCommand.execute();
  }
}
