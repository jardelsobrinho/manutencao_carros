import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manutencao_carros/config/routing/routes.dart';
import 'package:manutencao_carros/config/service_locator/service_locator.dart';
import 'package:manutencao_carros/ui/carros_cadastro/carros_cadastro_screen.dart';
import 'package:manutencao_carros/ui/carros_pesquisa/carros_pesquisa_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return CarrosPesquisaScreen(
          viewModel: getIt(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: Routes.carrosPesquisa,
          builder: (BuildContext context, GoRouterState state) {
            return CarrosPesquisaScreen(
              viewModel: getIt(),
            );
          },
        ),
      ],
    ),
  ],
);
