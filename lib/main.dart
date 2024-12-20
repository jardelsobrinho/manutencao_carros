import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/routing/router.dart';
import 'package:manutencao_carros/config/service_locator/service_locator.dart';
import 'package:manutencao_carros/config/supabase/supabase_configure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await configureSupabase();
  configureDependencies();
  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

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
