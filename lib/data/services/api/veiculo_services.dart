import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/domain/veiculo/veiculo_model.dart';

abstract class VeiculoServices {
  Future<Result<VeiculoModel>> inserir(VeiculoModel veiculoModel);
  Future<Result<VeiculoModel>> atualizar(VeiculoModel veiculoModel);
  Future<Result<List<VeiculoModel>>> pesquisa();
  Future<Result<VeiculoModel>> carregarPorId({required int veiculoId});
  Future<Result<void>> excluir({required int veiculoId});
}
