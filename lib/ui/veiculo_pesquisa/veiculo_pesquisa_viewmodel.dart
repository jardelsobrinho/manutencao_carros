import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/command.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/data/repositories/veiculos/veiculo_repository.dart';
import 'package:manutencao_carros/domain/carros/veiculo_model.dart';

@injectable
class VeiculoPesquisaViewModel extends ChangeNotifier {
  final VeiculoRepository repository;
  late final Command<void> pesquisar;

  VeiculoPesquisaViewModel({required this.repository}) {
    pesquisar = Command(_pesquisar)..execute();
  }

  final List<VeiculoModel> _listaVeiculos = [];
  List<VeiculoModel> get listaVeiculos => _listaVeiculos;

  Future<Result<void>> _pesquisar() async {
    final result = await repository.pesquisar();

    if (result is Ok) {
      _listaVeiculos.clear();
      _listaVeiculos.addAll((result as Ok).value);
    }

    notifyListeners();
    return result;
  }
}
