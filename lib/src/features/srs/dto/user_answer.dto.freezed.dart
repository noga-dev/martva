// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_answer.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserAnswerDto {
  @JsonKey()
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'flashcard_id')
  String get flashcardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_id')
  String get answerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UserAnswerDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAnswerDtoCopyWith<UserAnswerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAnswerDtoCopyWith<$Res> {
  factory $UserAnswerDtoCopyWith(
          UserAnswerDto value, $Res Function(UserAnswerDto) then) =
      _$UserAnswerDtoCopyWithImpl<$Res, UserAnswerDto>;
  @useResult
  $Res call(
      {@JsonKey() String id,
      @JsonKey(name: 'flashcard_id') String flashcardId,
      @JsonKey(name: 'answer_id') String answerId,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class _$UserAnswerDtoCopyWithImpl<$Res, $Val extends UserAnswerDto>
    implements $UserAnswerDtoCopyWith<$Res> {
  _$UserAnswerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? flashcardId = null,
    Object? answerId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      flashcardId: null == flashcardId
          ? _value.flashcardId
          : flashcardId // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAnswerDtoImplCopyWith<$Res>
    implements $UserAnswerDtoCopyWith<$Res> {
  factory _$$UserAnswerDtoImplCopyWith(
          _$UserAnswerDtoImpl value, $Res Function(_$UserAnswerDtoImpl) then) =
      __$$UserAnswerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey() String id,
      @JsonKey(name: 'flashcard_id') String flashcardId,
      @JsonKey(name: 'answer_id') String answerId,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class __$$UserAnswerDtoImplCopyWithImpl<$Res>
    extends _$UserAnswerDtoCopyWithImpl<$Res, _$UserAnswerDtoImpl>
    implements _$$UserAnswerDtoImplCopyWith<$Res> {
  __$$UserAnswerDtoImplCopyWithImpl(
      _$UserAnswerDtoImpl _value, $Res Function(_$UserAnswerDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? flashcardId = null,
    Object? answerId = null,
    Object? createdAt = null,
  }) {
    return _then(_$UserAnswerDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      flashcardId: null == flashcardId
          ? _value.flashcardId
          : flashcardId // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$UserAnswerDtoImpl implements _UserAnswerDto {
  const _$UserAnswerDtoImpl(
      {@JsonKey() this.id = '',
      @JsonKey(name: 'flashcard_id') this.flashcardId = '',
      @JsonKey(name: 'answer_id') this.answerId = '',
      @JsonKey(name: 'created_at') this.createdAt = ''});

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'flashcard_id')
  final String flashcardId;
  @override
  @JsonKey(name: 'answer_id')
  final String answerId;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'UserAnswerDto(id: $id, flashcardId: $flashcardId, answerId: $answerId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAnswerDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.flashcardId, flashcardId) ||
                other.flashcardId == flashcardId) &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, flashcardId, answerId, createdAt);

  /// Create a copy of UserAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAnswerDtoImplCopyWith<_$UserAnswerDtoImpl> get copyWith =>
      __$$UserAnswerDtoImplCopyWithImpl<_$UserAnswerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAnswerDtoImplToJson(
      this,
    );
  }
}

abstract class _UserAnswerDto implements UserAnswerDto {
  const factory _UserAnswerDto(
          {@JsonKey() final String id,
          @JsonKey(name: 'flashcard_id') final String flashcardId,
          @JsonKey(name: 'answer_id') final String answerId,
          @JsonKey(name: 'created_at') final String createdAt}) =
      _$UserAnswerDtoImpl;

  @override
  @JsonKey()
  String get id;
  @override
  @JsonKey(name: 'flashcard_id')
  String get flashcardId;
  @override
  @JsonKey(name: 'answer_id')
  String get answerId;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of UserAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAnswerDtoImplCopyWith<_$UserAnswerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
