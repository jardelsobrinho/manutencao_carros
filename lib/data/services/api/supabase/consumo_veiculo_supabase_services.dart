import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/data/services/api/consumo_veiculo_services.dart';
import 'package:manutencao_carros/domain/consumo_veiculo/consumo_veiculo_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: ConsumoVeiculoServices)
class ConsumoVeiculoSupabaseServices implements ConsumoVeiculoServices {
  final SupabaseClient supabaseClient;

  ConsumoVeiculoSupabaseServices({required this.supabaseClient});

  @override
  Future<Result<ConsumoVeiculoModel>> atualizar(
      {required ConsumoVeiculoModel model}) async {
    try {
      var result = await supabaseClient
          .from('consumo_veiculos')
          .update(model.toJson())
          .eq('id', model.id!)
          .select();
      return Result.ok(ConsumoVeiculoModel.fromJson(result.first));
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<ConsumoVeiculoModel>> carregarPorId({required int id}) async {
    try {
      var result =
          await supabaseClient.from('consumo_veiculos').select().eq('id', id);
      var consumos =
          result.map((json) => ConsumoVeiculoModel.fromJson(json)).toList();

      if (consumos.isNotEmpty) {
        return Result.ok(consumos[0]);
      } else {
        return Result.error("Nenhum consumo encontrado com o id $id");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<void>> excluir({required int id}) async {
    try {
      await supabaseClient
          .from('consumo_veiculos')
          .delete()
          .eq('id', id)
          .select();
      return Result.ok(null);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<ConsumoVeiculoModel>> inserir(
      {required ConsumoVeiculoModel model}) async {
    try {
      var result = await supabaseClient
          .from('consumo_veiculos')
          .insert(model.toJson())
          .select();
      return Result.ok(ConsumoVeiculoModel.fromJson(result.first));
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<List<ConsumoVeiculoModel>>> pesquisa(
      {required int veiculoId}) async {
    try {
      var result = await supabaseClient
          .from('veiculos')
          .select()
          .eq('veiculo_id', veiculoId);
      var consumos =
          result.map((json) => ConsumoVeiculoModel.fromJson(json)).toList();
      return Result.ok(consumos);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
