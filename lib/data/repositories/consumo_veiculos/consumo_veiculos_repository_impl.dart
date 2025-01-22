import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/data/repositories/consumo_veiculos/consumo_veiculos_repository.dart';
import 'package:manutencao_carros/data/services/api/consumo_veiculo_services.dart';
import 'package:manutencao_carros/domain/consumo_veiculo/consumo_veiculo_model.dart';

@Singleton(as: ConsumoVeiculosRepository)
class ConsumoVeiculosRepositoryImpl implements ConsumoVeiculosRepository {
  final ConsumoVeiculoServices service;

  ConsumoVeiculosRepositoryImpl({required this.service});

  @override
  Future<Result<ConsumoVeiculoModel>> carregarPorId({required int id}) async {
    return await service.carregarPorId(id: id);
  }

  @override
  Future<Result<void>> excluirPorId({required int id}) async {
    return await service.excluir(id: id);
  }

  @override
  Future<Result<ConsumoVeiculoModel>> gravar(ConsumoVeiculoModel model) async {
    if (model.id != null) {
      return await service.atualizar(model: model);
    } else {
      return await service.inserir(model: model);
    }
  }

  @override
  Future<Result<List<ConsumoVeiculoModel>>> pesquisar(
      {required int veiculoId}) async {
    return await service.pesquisa(veiculoId: veiculoId);
  }
}
