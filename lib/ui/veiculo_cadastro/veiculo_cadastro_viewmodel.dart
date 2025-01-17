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
  late final CommandArgs<VeiculoModel, int> carregaDados;

  VeiculoCadastroViewmodel({required this.repository}) {
    gravar = CommandArgs(_gravar);
    carregaDados = CommandArgs(_carregaDados);
  }

  VeiculoModel _veiculo = VeiculoModel.empty();
  VeiculoModel get veiculo => _veiculo;

  Future<Result<VeiculoModel>> _carregaDados(int veiculoId) async {
    final result = await repository.carregarPorId(veiculoId: veiculoId);

    if (result is Ok) {
      _veiculo = (result as Ok).value;
      notifyListeners();
    }

    return result;
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
