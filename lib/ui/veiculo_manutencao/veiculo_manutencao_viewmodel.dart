import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/command.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/data/repositories/veiculos/veiculo_repository.dart';
import 'package:manutencao_carros/domain/veiculo/veiculo_model.dart';

@injectable
class VeiculoManutencaoViewmodel extends ChangeNotifier {
  final VeiculoRepository repository;
  late CommandArgs<VeiculoModel, int> carregarPorId;
  late CommandArgs<void, int> excluirVeiculo;

  VeiculoManutencaoViewmodel({required this.repository}) {
    carregarPorId = CommandArgs(_carregarPorId);
    excluirVeiculo = CommandArgs(_excluirVeiculo);
  }

  VeiculoModel _veiculoManutencao = VeiculoModel.empty();
  VeiculoModel get veiculoManutencao => _veiculoManutencao;

  Future<Result<void>> _excluirVeiculo(int veiculoId) async {
    final result = await repository.excluirVeiculoPorId(veiculoId: veiculoId);
    return result;
  }

  Future<Result<VeiculoModel>> _carregarPorId(int veiculoId) async {
    final result = await repository.carregarPorId(veiculoId: veiculoId);
    if (result is Ok) {
      _veiculoManutencao = (result as Ok).value;
      notifyListeners();
    }
    return result;
  }
}
