import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/domain/consumo_veiculo/consumo_veiculo_model.dart';

abstract class ConsumoVeiculoServices {
  Future<Result<ConsumoVeiculoModel>> inserir(
      {required ConsumoVeiculoModel model});
  Future<Result<ConsumoVeiculoModel>> atualizar(
      {required ConsumoVeiculoModel model});
  Future<Result<List<ConsumoVeiculoModel>>> pesquisa({required int veiculoId});
  Future<Result<ConsumoVeiculoModel>> carregarPorId({required int id});
  Future<Result<void>> excluir({required int id});
}
