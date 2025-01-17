import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/command.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/data/repositories/veiculos/veiculo_repository.dart';
import 'package:manutencao_carros/domain/carros/veiculo_model.dart';

@injectable
class VeiculoManutencaoViewmodel extends ChangeNotifier {
  final VeiculoRepository repository;
  late CommandArgs<VeiculoModel, int> carregarPorId;

  VeiculoManutencaoViewmodel({required this.repository}) {
    carregarPorId = CommandArgs(_carregarPorId);
  }

  VeiculoModel _veiculoManutencao = VeiculoModel.empty();
  VeiculoModel get veiculoManutencao => _veiculoManutencao;

  Future<Result<VeiculoModel>> _carregarPorId(int veiculoId) async {
    final result = await repository.carregarPorId(veiculoId: veiculoId);
    if (result is Ok) {
      _veiculoManutencao = (result as Ok).value;
      notifyListeners();
    }
    return result;
  }
}
