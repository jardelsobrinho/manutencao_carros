import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manutencao_carros/config/routing/routes.dart';

class VeiculoManutencaoPopup extends StatelessWidget {
  const VeiculoManutencaoPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<VeiculoManutencaoMenuItem>(
      onSelected: (value) {
        switch (value) {
          case VeiculoManutencaoMenuItem.alterar:
            context.push("${Routes.carroCadastro}/1");
          case VeiculoManutencaoMenuItem.excluir:
            // TODO: Handle this case.
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
