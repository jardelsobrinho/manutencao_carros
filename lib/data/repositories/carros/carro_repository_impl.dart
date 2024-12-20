import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/data/repositories/carros/carro_repository.dart';
import 'package:manutencao_carros/data/services/api/carro_services.dart';
import 'package:manutencao_carros/domain/carros/carro_model.dart';

@Injectable(as: CarroRepository)
class CarroRepositoryImpl implements CarroRepository {
  final CarroServices service;

  CarroRepositoryImpl({required this.service});

  @override
  Future<Result<CarroModel>> gravar(CarroModel carroModel) async {
    return await service.inserir(carroModel);
  }

  @override
  Future<Result<List<CarroModel>>> pesquisar() async {
    return await service.pesquisa();
  }
}
