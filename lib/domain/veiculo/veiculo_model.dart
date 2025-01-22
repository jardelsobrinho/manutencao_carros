import 'package:freezed_annotation/freezed_annotation.dart';

part 'veiculo_model.freezed.dart';
part 'veiculo_model.g.dart';

@freezed
abstract class VeiculoModel with _$VeiculoModel {
  factory VeiculoModel({
    @JsonKey(includeToJson: false, includeFromJson: true) required int? id,
    required String nome,
    required String placa,
    required int kilometragem,
  }) = _VeiculoModel;

  factory VeiculoModel.fromJson(Map<String, dynamic> json) =>
      _$VeiculoModelFromJson(json);

  factory VeiculoModel.empty() => VeiculoModel(
        id: 0,
        nome: "",
        placa: "",
        kilometragem: 0,
      );
}
