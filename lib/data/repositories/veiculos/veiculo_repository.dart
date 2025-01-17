import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/domain/carros/veiculo_model.dart';

abstract class VeiculoRepository {
  Future<Result<VeiculoModel>> gravar(VeiculoModel veiculo);
  Future<Result<List<VeiculoModel>>> pesquisar();
  Future<Result<VeiculoModel>> carregarPorId({required int veiculoId});
}
