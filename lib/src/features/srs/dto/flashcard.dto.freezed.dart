// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FlashcardDto {
  @JsonKey(defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '', name: 'ticket_id')
  String get ticketId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date')
  String get dueDate => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0.0)
  double get stability => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0.0)
  double get difficulty => throw _privateConstructorUsedError;

  /// Serializes this FlashcardDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlashcardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlashcardDtoCopyWith<FlashcardDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardDtoCopyWith<$Res> {
  factory $FlashcardDtoCopyWith(
          FlashcardDto value, $Res Function(FlashcardDto) then) =
      _$FlashcardDtoCopyWithImpl<$Res, FlashcardDto>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String id,
      @JsonKey(defaultValue: '', name: 'ticket_id') String ticketId,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'due_date') String dueDate,
      @JsonKey(defaultValue: 0.0) double stability,
      @JsonKey(defaultValue: 0.0) double difficulty});
}

/// @nodoc
class _$FlashcardDtoCopyWithImpl<$Res, $Val extends FlashcardDto>
    implements $FlashcardDtoCopyWith<$Res> {
  _$FlashcardDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlashcardDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticketId = null,
    Object? createdAt = null,
    Object? dueDate = null,
    Object? stability = null,
    Object? difficulty = null,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String,
      stability: null == stability
          ? _value.stability
          : stability // ignore: cast_nullable_to_non_nullable
              as double,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlashcardDtoImplCopyWith<$Res>
    implements $FlashcardDtoCopyWith<$Res> {
  factory _$$FlashcardDtoImplCopyWith(
          _$FlashcardDtoImpl value, $Res Function(_$FlashcardDtoImpl) then) =
      __$$FlashcardDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String id,
      @JsonKey(defaultValue: '', name: 'ticket_id') String ticketId,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'due_date') String dueDate,
      @JsonKey(defaultValue: 0.0) double stability,
      @JsonKey(defaultValue: 0.0) double difficulty});
}

/// @nodoc
class __$$FlashcardDtoImplCopyWithImpl<$Res>
    extends _$FlashcardDtoCopyWithImpl<$Res, _$FlashcardDtoImpl>
    implements _$$FlashcardDtoImplCopyWith<$Res> {
  __$$FlashcardDtoImplCopyWithImpl(
      _$FlashcardDtoImpl _value, $Res Function(_$FlashcardDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlashcardDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticketId = null,
    Object? createdAt = null,
    Object? dueDate = null,
    Object? stability = null,
    Object? difficulty = null,
  }) {
    return _then(_$FlashcardDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String,
      stability: null == stability
          ? _value.stability
          : stability // ignore: cast_nullable_to_non_nullable
              as double,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$FlashcardDtoImpl implements _FlashcardDto {
  const _$FlashcardDtoImpl(
      {@JsonKey(defaultValue: '') this.id = '',
      @JsonKey(defaultValue: '', name: 'ticket_id') this.ticketId = '',
      @JsonKey(name: 'created_at') this.createdAt = '',
      @JsonKey(name: 'due_date') this.dueDate = '',
      @JsonKey(defaultValue: 0.0) this.stability = 0.0,
      @JsonKey(defaultValue: 0.0) this.difficulty = 0.0});

  @override
  @JsonKey(defaultValue: '')
  final String id;
  @override
  @JsonKey(defaultValue: '', name: 'ticket_id')
  final String ticketId;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'due_date')
  final String dueDate;
  @override
  @JsonKey(defaultValue: 0.0)
  final double stability;
  @override
  @JsonKey(defaultValue: 0.0)
  final double difficulty;

  @override
  String toString() {
    return 'FlashcardDto(id: $id, ticketId: $ticketId, createdAt: $createdAt, dueDate: $dueDate, stability: $stability, difficulty: $difficulty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashcardDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.stability, stability) ||
                other.stability == stability) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, ticketId, createdAt, dueDate, stability, difficulty);

  /// Create a copy of FlashcardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashcardDtoImplCopyWith<_$FlashcardDtoImpl> get copyWith =>
      __$$FlashcardDtoImplCopyWithImpl<_$FlashcardDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlashcardDtoImplToJson(
      this,
    );
  }
}

abstract class _FlashcardDto implements FlashcardDto {
  const factory _FlashcardDto(
          {@JsonKey(defaultValue: '') final String id,
          @JsonKey(defaultValue: '', name: 'ticket_id') final String ticketId,
          @JsonKey(name: 'created_at') final String createdAt,
          @JsonKey(name: 'due_date') final String dueDate,
          @JsonKey(defaultValue: 0.0) final double stability,
          @JsonKey(defaultValue: 0.0) final double difficulty}) =
      _$FlashcardDtoImpl;

  @override
  @JsonKey(defaultValue: '')
  String get id;
  @override
  @JsonKey(defaultValue: '', name: 'ticket_id')
  String get ticketId;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'due_date')
  String get dueDate;
  @override
  @JsonKey(defaultValue: 0.0)
  double get stability;
  @override
  @JsonKey(defaultValue: 0.0)
  double get difficulty;

  /// Create a copy of FlashcardDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlashcardDtoImplCopyWith<_$FlashcardDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
