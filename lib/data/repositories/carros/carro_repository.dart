import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/domain/carros/carro_model.dart';

abstract class CarroRepository {
  Future<Result<CarroModel>> gravar(CarroModel carro);
}
