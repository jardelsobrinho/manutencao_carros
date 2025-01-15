import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/data/repositories/veiculos/veiculo_repository.dart';
import 'package:manutencao_carros/data/services/api/veiculo_services.dart';
import 'package:manutencao_carros/domain/carros/veiculo_model.dart';

@Injectable(as: VeiculoRepository)
class VeiculoRepositoryImpl implements VeiculoRepository {
  final VeiculoServices service;

  VeiculoRepositoryImpl({required this.service});

  @override
  Future<Result<VeiculoModel>> gravar(VeiculoModel veiculo) async {
    return await service.inserir(veiculo);
  }

  @override
  Future<Result<List<VeiculoModel>>> pesquisar() async {
    return await service.pesquisa();
  }
}
