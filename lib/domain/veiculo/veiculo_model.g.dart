// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veiculo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VeiculoModelImpl _$$VeiculoModelImplFromJson(Map<String, dynamic> json) =>
    _$VeiculoModelImpl(
      id: (json['id'] as num?)?.toInt(),
      nome: json['nome'] as String,
      placa: json['placa'] as String,
      kilometragem: (json['kilometragem'] as num).toInt(),
    );

Map<String, dynamic> _$$VeiculoModelImplToJson(_$VeiculoModelImpl instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'placa': instance.placa,
      'kilometragem': instance.kilometragem,
    };
