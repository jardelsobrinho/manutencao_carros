import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/routing/routes.dart';
import 'package:manutencao_carros/config/service_locator/service_locator.dart';
import 'package:manutencao_carros/ui/veiculo_cadastro/veiculo_cadastro_screen.dart';
import 'package:manutencao_carros/ui/veiculo_manutencao/veiculo_manutencao_screen.dart';
import 'package:manutencao_carros/ui/veiculo_pesquisa/veiculo_pesquisa_screen.dart';

MaterialPageRoute? router(RouteSettings settings) {
  if (settings.name == Routes.carroPesquisa) {
    return MaterialPageRoute(
      builder: (context) {
        return VeiculoPesquisaScreen(
          viewModel: getIt(),
        );
      },
    );
  }

  if (settings.name == Routes.carroManutencao) {
    final veiculoId = settings.arguments as int;
    return MaterialPageRoute(
      builder: (context) {
        return VeiculoManutencaoScreen(
          veiculoId: veiculoId,
          viewModel: getIt(),
        );
      },
    );
  }

  if (settings.name == Routes.carroCadastro) {
    final veiculoId = settings.arguments as int;
    return MaterialPageRoute(
      builder: (context) {
        return VeiculoCadastroScreen(
          veiculoId: veiculoId,
          viewModel: getIt(),
        );
      },
    );
  }

  return null;
}
