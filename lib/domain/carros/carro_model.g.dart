// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carro_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarroModelImpl _$$CarroModelImplFromJson(Map<String, dynamic> json) =>
    _$CarroModelImpl(
      id: (json['id'] as num?)?.toInt(),
      nome: json['nome'] as String,
      placa: json['placa'] as String,
      kilometragem: (json['kilometragem'] as num).toInt(),
    );

Map<String, dynamic> _$$CarroModelImplToJson(_$CarroModelImpl instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'placa': instance.placa,
      'kilometragem': instance.kilometragem,
    };
