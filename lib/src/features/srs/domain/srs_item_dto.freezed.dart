// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'srs_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SrsItemDto _$SrsItemDtoFromJson(Map<String, dynamic> json) {
  return _SrsItemDto.fromJson(json);
}

/// @nodoc
mixin _$SrsItemDto {
  String get id => throw _privateConstructorUsedError;
  String get ticketId => throw _privateConstructorUsedError;
  DateTime get nextDueDate => throw _privateConstructorUsedError;
  int get interval => throw _privateConstructorUsedError;
  double get easeFactor => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SrsItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SrsItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SrsItemDtoCopyWith<SrsItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SrsItemDtoCopyWith<$Res> {
  factory $SrsItemDtoCopyWith(
          SrsItemDto value, $Res Function(SrsItemDto) then) =
      _$SrsItemDtoCopyWithImpl<$Res, SrsItemDto>;
  @useResult
  $Res call(
      {String id,
      String ticketId,
      DateTime nextDueDate,
      int interval,
      double easeFactor,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$SrsItemDtoCopyWithImpl<$Res, $Val extends SrsItemDto>
    implements $SrsItemDtoCopyWith<$Res> {
  _$SrsItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SrsItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticketId = null,
    Object? nextDueDate = null,
    Object? interval = null,
    Object? easeFactor = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      nextDueDate: null == nextDueDate
          ? _value.nextDueDate
          : nextDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      easeFactor: null == easeFactor
          ? _value.easeFactor
          : easeFactor // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SrsItemDtoImplCopyWith<$Res>
    implements $SrsItemDtoCopyWith<$Res> {
  factory _$$SrsItemDtoImplCopyWith(
          _$SrsItemDtoImpl value, $Res Function(_$SrsItemDtoImpl) then) =
      __$$SrsItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ticketId,
      DateTime nextDueDate,
      int interval,
      double easeFactor,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$SrsItemDtoImplCopyWithImpl<$Res>
    extends _$SrsItemDtoCopyWithImpl<$Res, _$SrsItemDtoImpl>
    implements _$$SrsItemDtoImplCopyWith<$Res> {
  __$$SrsItemDtoImplCopyWithImpl(
      _$SrsItemDtoImpl _value, $Res Function(_$SrsItemDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SrsItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticketId = null,
    Object? nextDueDate = null,
    Object? interval = null,
    Object? easeFactor = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SrsItemDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      nextDueDate: null == nextDueDate
          ? _value.nextDueDate
          : nextDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      easeFactor: null == easeFactor
          ? _value.easeFactor
          : easeFactor // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SrsItemDtoImpl implements _SrsItemDto {
  const _$SrsItemDtoImpl(
      {required this.id,
      required this.ticketId,
      required this.nextDueDate,
      required this.interval,
      required this.easeFactor,
      required this.createdAt,
      required this.updatedAt});

  factory _$SrsItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SrsItemDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String ticketId;
  @override
  final DateTime nextDueDate;
  @override
  final int interval;
  @override
  final double easeFactor;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'SrsItemDto(id: $id, ticketId: $ticketId, nextDueDate: $nextDueDate, interval: $interval, easeFactor: $easeFactor, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SrsItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.nextDueDate, nextDueDate) ||
                other.nextDueDate == nextDueDate) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.easeFactor, easeFactor) ||
                other.easeFactor == easeFactor) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, ticketId, nextDueDate,
      interval, easeFactor, createdAt, updatedAt);

  /// Create a copy of SrsItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SrsItemDtoImplCopyWith<_$SrsItemDtoImpl> get copyWith =>
      __$$SrsItemDtoImplCopyWithImpl<_$SrsItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SrsItemDtoImplToJson(
      this,
    );
  }
}

abstract class _SrsItemDto implements SrsItemDto {
  const factory _SrsItemDto(
      {required final String id,
      required final String ticketId,
      required final DateTime nextDueDate,
      required final int interval,
      required final double easeFactor,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$SrsItemDtoImpl;

  factory _SrsItemDto.fromJson(Map<String, dynamic> json) =
      _$SrsItemDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get ticketId;
  @override
  DateTime get nextDueDate;
  @override
  int get interval;
  @override
  double get easeFactor;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of SrsItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SrsItemDtoImplCopyWith<_$SrsItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SrsLogDto _$SrsLogDtoFromJson(Map<String, dynamic> json) {
  return _SrsLogDto.fromJson(json);
}

/// @nodoc
mixin _$SrsLogDto {
  String get id => throw _privateConstructorUsedError;
  String get srsItemId => throw _privateConstructorUsedError;
  String get ticketId => throw _privateConstructorUsedError;
  String get answerId => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  double get easeFactor => throw _privateConstructorUsedError;
  int get interval => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this SrsLogDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SrsLogDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SrsLogDtoCopyWith<SrsLogDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SrsLogDtoCopyWith<$Res> {
  factory $SrsLogDtoCopyWith(SrsLogDto value, $Res Function(SrsLogDto) then) =
      _$SrsLogDtoCopyWithImpl<$Res, SrsLogDto>;
  @useResult
  $Res call(
      {String id,
      String srsItemId,
      String ticketId,
      String answerId,
      bool isCorrect,
      double easeFactor,
      int interval,
      DateTime createdAt});
}

/// @nodoc
class _$SrsLogDtoCopyWithImpl<$Res, $Val extends SrsLogDto>
    implements $SrsLogDtoCopyWith<$Res> {
  _$SrsLogDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SrsLogDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? srsItemId = null,
    Object? ticketId = null,
    Object? answerId = null,
    Object? isCorrect = null,
    Object? easeFactor = null,
    Object? interval = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      srsItemId: null == srsItemId
          ? _value.srsItemId
          : srsItemId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      easeFactor: null == easeFactor
          ? _value.easeFactor
          : easeFactor // ignore: cast_nullable_to_non_nullable
              as double,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SrsLogDtoImplCopyWith<$Res>
    implements $SrsLogDtoCopyWith<$Res> {
  factory _$$SrsLogDtoImplCopyWith(
          _$SrsLogDtoImpl value, $Res Function(_$SrsLogDtoImpl) then) =
      __$$SrsLogDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String srsItemId,
      String ticketId,
      String answerId,
      bool isCorrect,
      double easeFactor,
      int interval,
      DateTime createdAt});
}

/// @nodoc
class __$$SrsLogDtoImplCopyWithImpl<$Res>
    extends _$SrsLogDtoCopyWithImpl<$Res, _$SrsLogDtoImpl>
    implements _$$SrsLogDtoImplCopyWith<$Res> {
  __$$SrsLogDtoImplCopyWithImpl(
      _$SrsLogDtoImpl _value, $Res Function(_$SrsLogDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SrsLogDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? srsItemId = null,
    Object? ticketId = null,
    Object? answerId = null,
    Object? isCorrect = null,
    Object? easeFactor = null,
    Object? interval = null,
    Object? createdAt = null,
  }) {
    return _then(_$SrsLogDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      srsItemId: null == srsItemId
          ? _value.srsItemId
          : srsItemId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      easeFactor: null == easeFactor
          ? _value.easeFactor
          : easeFactor // ignore: cast_nullable_to_non_nullable
              as double,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SrsLogDtoImpl implements _SrsLogDto {
  const _$SrsLogDtoImpl(
      {required this.id,
      required this.srsItemId,
      required this.ticketId,
      required this.answerId,
      required this.isCorrect,
      required this.easeFactor,
      required this.interval,
      required this.createdAt});

  factory _$SrsLogDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SrsLogDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String srsItemId;
  @override
  final String ticketId;
  @override
  final String answerId;
  @override
  final bool isCorrect;
  @override
  final double easeFactor;
  @override
  final int interval;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'SrsLogDto(id: $id, srsItemId: $srsItemId, ticketId: $ticketId, answerId: $answerId, isCorrect: $isCorrect, easeFactor: $easeFactor, interval: $interval, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SrsLogDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.srsItemId, srsItemId) ||
                other.srsItemId == srsItemId) &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.easeFactor, easeFactor) ||
                other.easeFactor == easeFactor) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, srsItemId, ticketId,
      answerId, isCorrect, easeFactor, interval, createdAt);

  /// Create a copy of SrsLogDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SrsLogDtoImplCopyWith<_$SrsLogDtoImpl> get copyWith =>
      __$$SrsLogDtoImplCopyWithImpl<_$SrsLogDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SrsLogDtoImplToJson(
      this,
    );
  }
}

abstract class _SrsLogDto implements SrsLogDto {
  const factory _SrsLogDto(
      {required final String id,
      required final String srsItemId,
      required final String ticketId,
      required final String answerId,
      required final bool isCorrect,
      required final double easeFactor,
      required final int interval,
      required final DateTime createdAt}) = _$SrsLogDtoImpl;

  factory _SrsLogDto.fromJson(Map<String, dynamic> json) =
      _$SrsLogDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get srsItemId;
  @override
  String get ticketId;
  @override
  String get answerId;
  @override
  bool get isCorrect;
  @override
  double get easeFactor;
  @override
  int get interval;
  @override
  DateTime get createdAt;

  /// Create a copy of SrsLogDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SrsLogDtoImplCopyWith<_$SrsLogDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
