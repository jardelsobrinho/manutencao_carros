import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/command.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/config/extensions/string_extension.dart';
import 'package:manutencao_carros/data/repositories/consumo_veiculos/consumo_veiculos_repository.dart';
import 'package:manutencao_carros/domain/consumo_veiculo/consumo_veiculo_model.dart';

@injectable
class ConsumoCadastroViewmodel extends ChangeNotifier {
  final ConsumoVeiculosRepository repository;
  late final CommandArgs<void, ParamsGravaConsumo> gravar;
  late final CommandArgs<ConsumoVeiculoModel, int> carregaDados;

  ConsumoCadastroViewmodel({required this.repository}) {
    gravar = CommandArgs(_gravar);
    carregaDados = CommandArgs(_carregaDados);
  }

  ConsumoVeiculoModel _veiculo = ConsumoVeiculoModel.empty();
  ConsumoVeiculoModel get veiculo => _veiculo;

  Future<Result<ConsumoVeiculoModel>> _carregaDados(int id) async {
    final result = await repository.carregarPorId(id: id);

    if (result is Ok) {
      _veiculo = (result as Ok).value;
      notifyListeners();
    }

    return result;
  }

  Future<Result<void>> _gravar(ParamsGravaConsumo params) async {
    var model = params.toConsumoVeiculoModel();
    return await repository.gravar(model);
  }
}

class ParamsGravaConsumo {
  final int id;
  final String litros;
  final String precoTotal;
  final String kilometragem;
  final int veiculoId;

  ParamsGravaConsumo({
    required this.id,
    required this.litros,
    required this.precoTotal,
    required this.kilometragem,
    required this.veiculoId,
  });

  ConsumoVeiculoModel toConsumoVeiculoModel() {
    return ConsumoVeiculoModel(
      id: id == 0 ? null : id,
      veiculoId: veiculoId,
      litros: litros.toDouble(),
      precoTotal: precoTotal.toDouble(),
      kilometragem: kilometragem.toInt(),
    );
  }
}
