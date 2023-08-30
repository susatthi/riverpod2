// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToDo _$ToDoFromJson(Map<String, dynamic> json) {
  return _ToDo.fromJson(json);
}

/// @nodoc
mixin _$ToDo {
  /// 将来的にFirestoreに依存しなくなることもありうる。
  /// そのため、DocumentReferenceではなくidのみを持たせる設計とする
  String? get id => throw _privateConstructorUsedError;

  /// updateAtはこう書く
  /// 今回は詳しくは説明しない。
  @alwaysUseServerTimestampSealedTimestampConverter
  SealedTimestamp get updatedAt => throw _privateConstructorUsedError;

  /// createdAtはこう書く
  /// 今回は詳しくは説明しない。
  @sealedTimestampConverter
  SealedTimestamp get createdAt => throw _privateConstructorUsedError;

  /// todoの説明
  String get description => throw _privateConstructorUsedError;

  /// 完了済みかどうか
  bool get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToDoCopyWith<ToDo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoCopyWith<$Res> {
  factory $ToDoCopyWith(ToDo value, $Res Function(ToDo) then) =
      _$ToDoCopyWithImpl<$Res, ToDo>;
  @useResult
  $Res call(
      {String? id,
      @alwaysUseServerTimestampSealedTimestampConverter
          SealedTimestamp updatedAt,
      @sealedTimestampConverter
          SealedTimestamp createdAt,
      String description,
      bool isCompleted});
}

/// @nodoc
class _$ToDoCopyWithImpl<$Res, $Val extends ToDo>
    implements $ToDoCopyWith<$Res> {
  _$ToDoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? updatedAt = null,
    Object? createdAt = null,
    Object? description = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as SealedTimestamp,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as SealedTimestamp,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ToDoCopyWith<$Res> implements $ToDoCopyWith<$Res> {
  factory _$$_ToDoCopyWith(_$_ToDo value, $Res Function(_$_ToDo) then) =
      __$$_ToDoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @alwaysUseServerTimestampSealedTimestampConverter
          SealedTimestamp updatedAt,
      @sealedTimestampConverter
          SealedTimestamp createdAt,
      String description,
      bool isCompleted});
}

/// @nodoc
class __$$_ToDoCopyWithImpl<$Res> extends _$ToDoCopyWithImpl<$Res, _$_ToDo>
    implements _$$_ToDoCopyWith<$Res> {
  __$$_ToDoCopyWithImpl(_$_ToDo _value, $Res Function(_$_ToDo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? updatedAt = null,
    Object? createdAt = null,
    Object? description = null,
    Object? isCompleted = null,
  }) {
    return _then(_$_ToDo(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as SealedTimestamp,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as SealedTimestamp,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ToDo extends _ToDo {
  _$_ToDo(
      {this.id,
      @alwaysUseServerTimestampSealedTimestampConverter
          this.updatedAt = const ServerTimestamp(),
      @sealedTimestampConverter
          this.createdAt = const ServerTimestamp(),
      this.description = '',
      this.isCompleted = false})
      : super._();

  factory _$_ToDo.fromJson(Map<String, dynamic> json) => _$$_ToDoFromJson(json);

  /// 将来的にFirestoreに依存しなくなることもありうる。
  /// そのため、DocumentReferenceではなくidのみを持たせる設計とする
  @override
  final String? id;

  /// updateAtはこう書く
  /// 今回は詳しくは説明しない。
  @override
  @JsonKey()
  @alwaysUseServerTimestampSealedTimestampConverter
  final SealedTimestamp updatedAt;

  /// createdAtはこう書く
  /// 今回は詳しくは説明しない。
  @override
  @JsonKey()
  @sealedTimestampConverter
  final SealedTimestamp createdAt;

  /// todoの説明
  @override
  @JsonKey()
  final String description;

  /// 完了済みかどうか
  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString() {
    return 'ToDo(id: $id, updatedAt: $updatedAt, createdAt: $createdAt, description: $description, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToDo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, updatedAt, createdAt, description, isCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToDoCopyWith<_$_ToDo> get copyWith =>
      __$$_ToDoCopyWithImpl<_$_ToDo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ToDoToJson(
      this,
    );
  }
}

abstract class _ToDo extends ToDo {
  factory _ToDo(
      {final String? id,
      @alwaysUseServerTimestampSealedTimestampConverter
          final SealedTimestamp updatedAt,
      @sealedTimestampConverter
          final SealedTimestamp createdAt,
      final String description,
      final bool isCompleted}) = _$_ToDo;
  _ToDo._() : super._();

  factory _ToDo.fromJson(Map<String, dynamic> json) = _$_ToDo.fromJson;

  @override

  /// 将来的にFirestoreに依存しなくなることもありうる。
  /// そのため、DocumentReferenceではなくidのみを持たせる設計とする
  String? get id;
  @override

  /// updateAtはこう書く
  /// 今回は詳しくは説明しない。
  @alwaysUseServerTimestampSealedTimestampConverter
  SealedTimestamp get updatedAt;
  @override

  /// createdAtはこう書く
  /// 今回は詳しくは説明しない。
  @sealedTimestampConverter
  SealedTimestamp get createdAt;
  @override

  /// todoの説明
  String get description;
  @override

  /// 完了済みかどうか
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$_ToDoCopyWith<_$_ToDo> get copyWith => throw _privateConstructorUsedError;
}
