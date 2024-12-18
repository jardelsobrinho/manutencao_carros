// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carro_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarroModel _$CarroModelFromJson(Map<String, dynamic> json) {
  return _CarroModel.fromJson(json);
}

/// @nodoc
mixin _$CarroModel {
  String get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;

  /// Serializes this CarroModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarroModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarroModelCopyWith<CarroModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarroModelCopyWith<$Res> {
  factory $CarroModelCopyWith(
          CarroModel value, $Res Function(CarroModel) then) =
      _$CarroModelCopyWithImpl<$Res, CarroModel>;
  @useResult
  $Res call({String id, String nome});
}

/// @nodoc
class _$CarroModelCopyWithImpl<$Res, $Val extends CarroModel>
    implements $CarroModelCopyWith<$Res> {
  _$CarroModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarroModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarroModelImplCopyWith<$Res>
    implements $CarroModelCopyWith<$Res> {
  factory _$$CarroModelImplCopyWith(
          _$CarroModelImpl value, $Res Function(_$CarroModelImpl) then) =
      __$$CarroModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nome});
}

/// @nodoc
class __$$CarroModelImplCopyWithImpl<$Res>
    extends _$CarroModelCopyWithImpl<$Res, _$CarroModelImpl>
    implements _$$CarroModelImplCopyWith<$Res> {
  __$$CarroModelImplCopyWithImpl(
      _$CarroModelImpl _value, $Res Function(_$CarroModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarroModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
  }) {
    return _then(_$CarroModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarroModelImpl implements _CarroModel {
  const _$CarroModelImpl({required this.id, required this.nome});

  factory _$CarroModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarroModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nome;

  @override
  String toString() {
    return 'CarroModel(id: $id, nome: $nome)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarroModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nome);

  /// Create a copy of CarroModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarroModelImplCopyWith<_$CarroModelImpl> get copyWith =>
      __$$CarroModelImplCopyWithImpl<_$CarroModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarroModelImplToJson(
      this,
    );
  }
}

abstract class _CarroModel implements CarroModel {
  const factory _CarroModel(
      {required final String id,
      required final String nome}) = _$CarroModelImpl;

  factory _CarroModel.fromJson(Map<String, dynamic> json) =
      _$CarroModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;

  /// Create a copy of CarroModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarroModelImplCopyWith<_$CarroModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
