import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/domain/carros/carro_model.dart';

abstract class CarroServices {
  Future<Result<CarroModel>> inserir(CarroModel carroModel);
  Future<Result<List<CarroModel>>> pesquisa();
}
