import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/routing/routes.dart';

class VeiculoManutencaoPopup extends StatelessWidget {
  final int veiculoId;
  const VeiculoManutencaoPopup({
    required this.veiculoId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<VeiculoManutencaoMenuItem>(
      onSelected: (value) {
        switch (value) {
          case VeiculoManutencaoMenuItem.alterar:
            Navigator.pushNamed(
              context,
              Routes.carroCadastro,
              arguments: veiculoId,
            );

          case VeiculoManutencaoMenuItem.excluir:
            throw UnimplementedError();
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
