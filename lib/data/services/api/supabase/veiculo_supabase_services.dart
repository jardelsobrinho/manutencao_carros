import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/data/services/api/veiculo_services.dart';
import 'package:manutencao_carros/domain/carros/veiculo_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: VeiculoServices)
class VeiculoSupabaseServices implements VeiculoServices {
  final SupabaseClient supabaseClient;

  VeiculoSupabaseServices({required this.supabaseClient});

  @override
  Future<Result<VeiculoModel>> inserir(VeiculoModel veiculoModel) async {
    try {
      var result = await supabaseClient
          .from('veiculos')
          .insert(veiculoModel.toJson())
          .select();
      return Result.ok(VeiculoModel.fromJson(result.first));
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<List<VeiculoModel>>> pesquisa() async {
    try {
      var result = await supabaseClient.from('veiculos').select();
      var listaCarros =
          result.map((json) => VeiculoModel.fromJson(json)).toList();
      return Result.ok(listaCarros);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<VeiculoModel>> carregarPorId({required int veiculoId}) async {
    try {
      var result =
          await supabaseClient.from('veiculos').select().eq('id', veiculoId);
      var listaCarros =
          result.map((json) => VeiculoModel.fromJson(json)).toList();

      if (listaCarros.isNotEmpty) {
        return Result.ok(listaCarros[0]);
      } else {
        return Result.error("Nenhum veiculo encontrado com o id $veiculoId");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<VeiculoModel>> atualizar(VeiculoModel veiculoModel) async {
    try {
      var result = await supabaseClient
          .from('veiculos')
          .update(veiculoModel.toJson())
          .eq('id', veiculoModel.id!)
          .select();
      return Result.ok(VeiculoModel.fromJson(result.first));
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<void>> excluir({required int veiculoId}) async {
    try {
      await supabaseClient
          .from('veiculos')
          .delete()
          .eq('id', veiculoId)
          .select();
      return Result.ok(null);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
