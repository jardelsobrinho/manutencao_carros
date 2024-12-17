import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/routing/router.dart';
import 'package:manutencao_carros/config/service_locator/service_locator.dart';

void main() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
