import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manutencao_carros/config/routing/routes.dart';
import 'package:manutencao_carros/config/service_locator/service_locator.dart';
import 'package:manutencao_carros/ui/veiculo_cadastro/veiculo_cadastro_screen.dart';
import 'package:manutencao_carros/ui/veiculo_manutencao/veiculo_manutencao_screen.dart';
import 'package:manutencao_carros/ui/veiculo_pesquisa/veiculo_pesquisa_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return VeiculoPesquisaScreen(
          viewModel: getIt(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: "${Routes.carroCadastro}/:id",
          builder: (BuildContext context, GoRouterState state) {
            final id = int.parse(state.pathParameters["id"].toString());
            return CarrosCadastroScreen(
              veiculoId: id,
              viewModel: getIt(),
            );
          },
        ),
        GoRoute(
          path: Routes.carroPesquisa,
          builder: (BuildContext context, GoRouterState state) {
            return VeiculoPesquisaScreen(
              viewModel: getIt(),
            );
          },
        ),
        GoRoute(
          path: "${Routes.carroManutencao}/:id",
          builder: (BuildContext context, GoRouterState state) {
            return VeiculoManutencaoScreen(
              viewModel: getIt(),
            );
          },
        ),
      ],
    ),
  ],
);
