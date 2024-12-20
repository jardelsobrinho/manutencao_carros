import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/command.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/data/repositories/carros/carro_repository.dart';
import 'package:manutencao_carros/domain/carros/carro_model.dart';

@injectable
class CarrosCadastroViewmodel extends ChangeNotifier {
  final CarroRepository repository;
  late final CommandArgs<void, ParamsGravaCarro> gravar;

  CarrosCadastroViewmodel({required this.repository}) {
    gravar = CommandArgs(_gravar);
  }

  Future<Result<void>> _gravar(ParamsGravaCarro params) async {
    var carroModel = params.fromCarroModel();
    return await repository.gravar(carroModel);
  }
}

class ParamsGravaCarro {
  final String nome;
  final String placa;
  final String kilometragem;

  ParamsGravaCarro({
    required this.nome,
    required this.placa,
    required this.kilometragem,
  });

  CarroModel fromCarroModel() {
    return CarroModel(
      id: null,
      nome: nome,
      placa: placa,
      kilometragem: int.parse(kilometragem),
    );
  }
}
