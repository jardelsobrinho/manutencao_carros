import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/command.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/data/repositories/carros/carro_repository.dart';

@injectable
class CarrosCadastroViewmodel extends ChangeNotifier {
  final CarroRepository repository;
  late final CommandArgs<void, DadosCadastroCarro> gravar;

  CarrosCadastroViewmodel({required this.repository}) {
    gravar = CommandArgs(_gravar);
  }

  Future<Result<void>> _gravar(DadosCadastroCarro dados) async {
    await Future.delayed(Duration(seconds: 3));
    return Result.ok(null);
  }
}

class DadosCadastroCarro {
  final String nome;
  final String placa;
  final String kilometragem;

  DadosCadastroCarro({
    required this.nome,
    required this.placa,
    required this.kilometragem,
  });
}
