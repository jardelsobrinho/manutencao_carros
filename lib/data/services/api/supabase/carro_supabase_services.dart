import 'package:injectable/injectable.dart';
import 'package:manutencao_carros/config/commands/result.dart';
import 'package:manutencao_carros/data/services/api/carro_services.dart';
import 'package:manutencao_carros/domain/carros/carro_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: CarroServices)
class CarroSupabaseServices implements CarroServices {
  final SupabaseClient supabaseClient;

  CarroSupabaseServices({required this.supabaseClient});

  @override
  Future<Result<CarroModel>> inserir(CarroModel carroModel) async {
    try {
      var result = await supabaseClient
          .from('carros')
          .insert(carroModel.toJson())
          .select();
      return Result.ok(CarroModel.fromJson(result.first));
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<List<CarroModel>>> pesquisa() async {
    try {
      var result = await supabaseClient.from('carros').select();
      var listaCarros =
          result.map((json) => CarroModel.fromJson(json)).toList();
      return Result.ok(listaCarros);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
