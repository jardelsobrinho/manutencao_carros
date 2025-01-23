import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumo_veiculo_model.freezed.dart';
part 'consumo_veiculo_model.g.dart';

@freezed
abstract class ConsumoVeiculoModel with _$ConsumoVeiculoModel {
  factory ConsumoVeiculoModel(
      {@JsonKey(includeToJson: false, includeFromJson: true) required int? id,
      required double litros,
      @JsonKey(name: "preco_total") required double precoTotal,
      required int kilometragem,
      @JsonKey(name: "veiculo_id")
      required int veiculoId}) = _ConsumoVeiculoModel;

  factory ConsumoVeiculoModel.fromJson(Map<String, dynamic> json) =>
      _$ConsumoVeiculoModelFromJson(json);

  factory ConsumoVeiculoModel.empty() => ConsumoVeiculoModel(
        id: 0,
        litros: 0,
        precoTotal: 0,
        kilometragem: 0,
        veiculoId: 0,
      );
}
