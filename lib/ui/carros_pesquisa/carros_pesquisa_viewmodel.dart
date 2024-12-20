import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/command.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/data/repositories/carros/carro_repository.dart';
import 'package:manutencao_carros/domain/carros/carro_model.dart';

@injectable
class CarrosPesquisaViewModel extends ChangeNotifier {
  final CarroRepository repository;
  late final Command<void> pesquisar;

  CarrosPesquisaViewModel({required this.repository}) {
    pesquisar = Command(_pesquisar)..execute();
  }

  final List<CarroModel> _listaCarros = [];
  List<CarroModel> get listaCarros => _listaCarros;

  Future<Result<void>> _pesquisar() async {
    final result = await repository.pesquisar();

    if (result is Ok) {
      _listaCarros.clear();
      _listaCarros.addAll((result as Ok).value);
    }

    notifyListeners();
    return result;
  }
}
