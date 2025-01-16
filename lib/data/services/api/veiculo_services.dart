import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/domain/carros/veiculo_model.dart';

abstract class VeiculoServices {
  Future<Result<VeiculoModel>> inserir(VeiculoModel veiculoModel);
  Future<Result<List<VeiculoModel>>> pesquisa();
}