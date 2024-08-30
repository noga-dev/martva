// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewDto {
  @JsonKey(defaultValue: '', name: 'id')
  String get id => throw _privateConstructorUsedError; //
  @JsonKey(defaultValue: '', name: 'ticket_id')
  String get ticketId => throw _privateConstructorUsedError; //
  @JsonKey(defaultValue: '', name: 'next_review_at')
  String get nextReviewAt => throw _privateConstructorUsedError; //
  @JsonKey(defaultValue: 0, name: 'interval')
  int get interval => throw _privateConstructorUsedError; //
  @JsonKey(defaultValue: 0, name: 'stage')
  int get stage => throw _privateConstructorUsedError;

  /// Serializes this ReviewDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewDtoCopyWith<ReviewDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewDtoCopyWith<$Res> {
  factory $ReviewDtoCopyWith(ReviewDto value, $Res Function(ReviewDto) then) =
      _$ReviewDtoCopyWithImpl<$Res, ReviewDto>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '', name: 'id') String id,
      @JsonKey(defaultValue: '', name: 'ticket_id') String ticketId,
      @JsonKey(defaultValue: '', name: 'next_review_at') String nextReviewAt,
      @JsonKey(defaultValue: 0, name: 'interval') int interval,
      @JsonKey(defaultValue: 0, name: 'stage') int stage});
}

/// @nodoc
class _$ReviewDtoCopyWithImpl<$Res, $Val extends ReviewDto>
    implements $ReviewDtoCopyWith<$Res> {
  _$ReviewDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticketId = null,
    Object? nextReviewAt = null,
    Object? interval = null,
    Object? stage = null,
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
      nextReviewAt: null == nextReviewAt
          ? _value.nextReviewAt
          : nextReviewAt // ignore: cast_nullable_to_non_nullable
              as String,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewDtoImplCopyWith<$Res>
    implements $ReviewDtoCopyWith<$Res> {
  factory _$$ReviewDtoImplCopyWith(
          _$ReviewDtoImpl value, $Res Function(_$ReviewDtoImpl) then) =
      __$$ReviewDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '', name: 'id') String id,
      @JsonKey(defaultValue: '', name: 'ticket_id') String ticketId,
      @JsonKey(defaultValue: '', name: 'next_review_at') String nextReviewAt,
      @JsonKey(defaultValue: 0, name: 'interval') int interval,
      @JsonKey(defaultValue: 0, name: 'stage') int stage});
}

/// @nodoc
class __$$ReviewDtoImplCopyWithImpl<$Res>
    extends _$ReviewDtoCopyWithImpl<$Res, _$ReviewDtoImpl>
    implements _$$ReviewDtoImplCopyWith<$Res> {
  __$$ReviewDtoImplCopyWithImpl(
      _$ReviewDtoImpl _value, $Res Function(_$ReviewDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticketId = null,
    Object? nextReviewAt = null,
    Object? interval = null,
    Object? stage = null,
  }) {
    return _then(_$ReviewDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      nextReviewAt: null == nextReviewAt
          ? _value.nextReviewAt
          : nextReviewAt // ignore: cast_nullable_to_non_nullable
              as String,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ReviewDtoImpl implements _ReviewDto {
  const _$ReviewDtoImpl(
      {@JsonKey(defaultValue: '', name: 'id') this.id = '',
      @JsonKey(defaultValue: '', name: 'ticket_id') this.ticketId = '',
      @JsonKey(defaultValue: '', name: 'next_review_at') this.nextReviewAt = '',
      @JsonKey(defaultValue: 0, name: 'interval') this.interval = 0,
      @JsonKey(defaultValue: 0, name: 'stage') this.stage = 0});

  @override
  @JsonKey(defaultValue: '', name: 'id')
  final String id;
//
  @override
  @JsonKey(defaultValue: '', name: 'ticket_id')
  final String ticketId;
//
  @override
  @JsonKey(defaultValue: '', name: 'next_review_at')
  final String nextReviewAt;
//
  @override
  @JsonKey(defaultValue: 0, name: 'interval')
  final int interval;
//
  @override
  @JsonKey(defaultValue: 0, name: 'stage')
  final int stage;

  @override
  String toString() {
    return 'ReviewDto(id: $id, ticketId: $ticketId, nextReviewAt: $nextReviewAt, interval: $interval, stage: $stage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.nextReviewAt, nextReviewAt) ||
                other.nextReviewAt == nextReviewAt) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.stage, stage) || other.stage == stage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, ticketId, nextReviewAt, interval, stage);

  /// Create a copy of ReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewDtoImplCopyWith<_$ReviewDtoImpl> get copyWith =>
      __$$ReviewDtoImplCopyWithImpl<_$ReviewDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewDtoImplToJson(
      this,
    );
  }
}

abstract class _ReviewDto implements ReviewDto {
  const factory _ReviewDto(
          {@JsonKey(defaultValue: '', name: 'id') final String id,
          @JsonKey(defaultValue: '', name: 'ticket_id') final String ticketId,
          @JsonKey(defaultValue: '', name: 'next_review_at')
          final String nextReviewAt,
          @JsonKey(defaultValue: 0, name: 'interval') final int interval,
          @JsonKey(defaultValue: 0, name: 'stage') final int stage}) =
      _$ReviewDtoImpl;

  @override
  @JsonKey(defaultValue: '', name: 'id')
  String get id; //
  @override
  @JsonKey(defaultValue: '', name: 'ticket_id')
  String get ticketId; //
  @override
  @JsonKey(defaultValue: '', name: 'next_review_at')
  String get nextReviewAt; //
  @override
  @JsonKey(defaultValue: 0, name: 'interval')
  int get interval; //
  @override
  @JsonKey(defaultValue: 0, name: 'stage')
  int get stage;

  /// Create a copy of ReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewDtoImplCopyWith<_$ReviewDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
