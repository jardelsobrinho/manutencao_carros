import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/command.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/data/repositories/veiculos/veiculo_repository.dart';
import 'package:manutencao_carros/domain/carros/veiculo_model.dart';

@injectable
class VeiculoCadastroViewmodel extends ChangeNotifier {
  final VeiculoRepository repository;
  late final CommandArgs<void, ParamsGravaCarro> gravar;
  late final Command<void> carregaDados;

  VeiculoCadastroViewmodel({required this.repository}) {
    gravar = CommandArgs(_gravar);
    carregaDados = Command(_carregaDados);
  }

  Future<Result<void>> _carregaDados() async {
    await Future.delayed(Duration(seconds: 3));
    return Result.error("Falha no envio");
  }

  Future<Result<void>> _gravar(ParamsGravaCarro params) async {
    var carroModel = params.fromVeiculoModel();
    return await repository.gravar(carroModel);
  }
}

class ParamsGravaCarro {
  final int id;
  final String nome;
  final String placa;
  final String kilometragem;

  ParamsGravaCarro({
    required this.id,
    required this.nome,
    required this.placa,
    required this.kilometragem,
  });

  VeiculoModel fromVeiculoModel() {
    return VeiculoModel(
      id: id == 0 ? null : id,
      nome: nome,
      placa: placa,
      kilometragem: int.parse(kilometragem),
    );
  }
}
