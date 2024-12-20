import 'package:freezed_annotation/freezed_annotation.dart';

part 'carro_model.freezed.dart';
part 'carro_model.g.dart';

@freezed
abstract class CarroModel with _$CarroModel {
  factory CarroModel({
    @JsonKey(includeToJson: false, includeFromJson: true) required int? id,
    required String nome,
    required String placa,
    required int kilometragem,
  }) = _CarroModel;

  factory CarroModel.fromJson(Map<String, dynamic> json) =>
      _$CarroModelFromJson(json);
}
