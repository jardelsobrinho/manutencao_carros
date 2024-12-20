import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/data/repositories/carros/carro_repository.dart';
import 'package:manutencao_carros/domain/carros/carro_model.dart';

@Injectable(as: CarroRepository)
class CarroRepositoryImpl implements CarroRepository {
  @override
  Future<Result<CarroModel>> gravar(CarroModel carro) async {
    await Future.delayed(Duration(seconds: 3));
    return Result.ok(carro);
  }
}
