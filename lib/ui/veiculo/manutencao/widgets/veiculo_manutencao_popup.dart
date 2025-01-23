import 'package:flutter/material.dart';

class VeiculoManutencaoPopup extends StatelessWidget {
  final int veiculoId;
  final void Function(int) onTapAlterarVeiculo;
  final void Function(int) onTapExcluirVeiculo;
  const VeiculoManutencaoPopup({
    required this.veiculoId,
    required this.onTapAlterarVeiculo,
    required this.onTapExcluirVeiculo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<VeiculoManutencaoMenuItem>(
      onSelected: (value) {
        switch (value) {
          case VeiculoManutencaoMenuItem.alterar:
            onTapAlterarVeiculo(veiculoId);

          case VeiculoManutencaoMenuItem.excluir:
            onTapExcluirVeiculo(veiculoId);
        }
      },
      itemBuilder: (BuildContext bc) {
        return const [
          PopupMenuItem<VeiculoManutencaoMenuItem>(
            value: VeiculoManutencaoMenuItem.alterar,
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text('Alterar'),
            ),
          ),
          PopupMenuItem<VeiculoManutencaoMenuItem>(
            value: VeiculoManutencaoMenuItem.excluir,
            child: ListTile(
              leading: Icon(Icons.delete),
              title: Text('Excluir'),
            ),
          ),
        ];
      },
    );
  }
}

enum VeiculoManutencaoMenuItem { alterar, excluir }
