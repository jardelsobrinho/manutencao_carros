import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/domain/carros/carro_model.dart';

@injectable
class CarrosPesquisaViewModel extends ChangeNotifier {
  final List<CarroModel> _listaCarros = [];
  List<CarroModel> get listaCarros => _listaCarros;

  Future<Result<void>> carregaDados() async {
    notifyListeners();
    return Result.ok(null);
  }
}
