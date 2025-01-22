// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'veiculo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VeiculoModel _$VeiculoModelFromJson(Map<String, dynamic> json) {
  return _VeiculoModel.fromJson(json);
}

/// @nodoc
mixin _$VeiculoModel {
  @JsonKey(includeToJson: false, includeFromJson: true)
  int? get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get placa => throw _privateConstructorUsedError;
  int get kilometragem => throw _privateConstructorUsedError;

  /// Serializes this VeiculoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VeiculoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VeiculoModelCopyWith<VeiculoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VeiculoModelCopyWith<$Res> {
  factory $VeiculoModelCopyWith(
          VeiculoModel value, $Res Function(VeiculoModel) then) =
      _$VeiculoModelCopyWithImpl<$Res, VeiculoModel>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false, includeFromJson: true) int? id,
      String nome,
      String placa,
      int kilometragem});
}

/// @nodoc
class _$VeiculoModelCopyWithImpl<$Res, $Val extends VeiculoModel>
    implements $VeiculoModelCopyWith<$Res> {
  _$VeiculoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VeiculoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nome = null,
    Object? placa = null,
    Object? kilometragem = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      placa: null == placa
          ? _value.placa
          : placa // ignore: cast_nullable_to_non_nullable
              as String,
      kilometragem: null == kilometragem
          ? _value.kilometragem
          : kilometragem // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VeiculoModelImplCopyWith<$Res>
    implements $VeiculoModelCopyWith<$Res> {
  factory _$$VeiculoModelImplCopyWith(
          _$VeiculoModelImpl value, $Res Function(_$VeiculoModelImpl) then) =
      __$$VeiculoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false, includeFromJson: true) int? id,
      String nome,
      String placa,
      int kilometragem});
}

/// @nodoc
class __$$VeiculoModelImplCopyWithImpl<$Res>
    extends _$VeiculoModelCopyWithImpl<$Res, _$VeiculoModelImpl>
    implements _$$VeiculoModelImplCopyWith<$Res> {
  __$$VeiculoModelImplCopyWithImpl(
      _$VeiculoModelImpl _value, $Res Function(_$VeiculoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VeiculoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nome = null,
    Object? placa = null,
    Object? kilometragem = null,
  }) {
    return _then(_$VeiculoModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      placa: null == placa
          ? _value.placa
          : placa // ignore: cast_nullable_to_non_nullable
              as String,
      kilometragem: null == kilometragem
          ? _value.kilometragem
          : kilometragem // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VeiculoModelImpl implements _VeiculoModel {
  _$VeiculoModelImpl(
      {@JsonKey(includeToJson: false, includeFromJson: true) required this.id,
      required this.nome,
      required this.placa,
      required this.kilometragem});

  factory _$VeiculoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VeiculoModelImplFromJson(json);

  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final int? id;
  @override
  final String nome;
  @override
  final String placa;
  @override
  final int kilometragem;

  @override
  String toString() {
    return 'VeiculoModel(id: $id, nome: $nome, placa: $placa, kilometragem: $kilometragem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VeiculoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.placa, placa) || other.placa == placa) &&
            (identical(other.kilometragem, kilometragem) ||
                other.kilometragem == kilometragem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nome, placa, kilometragem);

  /// Create a copy of VeiculoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VeiculoModelImplCopyWith<_$VeiculoModelImpl> get copyWith =>
      __$$VeiculoModelImplCopyWithImpl<_$VeiculoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VeiculoModelImplToJson(
      this,
    );
  }
}

abstract class _VeiculoModel implements VeiculoModel {
  factory _VeiculoModel(
      {@JsonKey(includeToJson: false, includeFromJson: true)
      required final int? id,
      required final String nome,
      required final String placa,
      required final int kilometragem}) = _$VeiculoModelImpl;

  factory _VeiculoModel.fromJson(Map<String, dynamic> json) =
      _$VeiculoModelImpl.fromJson;

  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  int? get id;
  @override
  String get nome;
  @override
  String get placa;
  @override
  int get kilometragem;

  /// Create a copy of VeiculoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VeiculoModelImplCopyWith<_$VeiculoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
