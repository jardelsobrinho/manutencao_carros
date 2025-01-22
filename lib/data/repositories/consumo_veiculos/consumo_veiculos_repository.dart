import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/domain/consumo_veiculo/consumo_veiculo_model.dart';

abstract class ConsumoVeiculosRepository {
  Future<Result<ConsumoVeiculoModel>> gravar(ConsumoVeiculoModel model);
  Future<Result<List<ConsumoVeiculoModel>>> pesquisar({required int veiculoId});
  Future<Result<ConsumoVeiculoModel>> carregarPorId({required int id});
  Future<Result<void>> excluirPorId({required int id});
}
