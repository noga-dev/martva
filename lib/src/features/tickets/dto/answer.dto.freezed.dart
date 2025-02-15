// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnswerDto {
  @JsonKey(defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get answer => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: -1)
  int get ordinal => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get correct => throw _privateConstructorUsedError;

  /// Serializes this AnswerDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerDtoCopyWith<AnswerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerDtoCopyWith<$Res> {
  factory $AnswerDtoCopyWith(AnswerDto value, $Res Function(AnswerDto) then) =
      _$AnswerDtoCopyWithImpl<$Res, AnswerDto>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String id,
      @JsonKey(defaultValue: '') String answer,
      @JsonKey(defaultValue: -1) int ordinal,
      @JsonKey(defaultValue: false) bool correct});
}

/// @nodoc
class _$AnswerDtoCopyWithImpl<$Res, $Val extends AnswerDto>
    implements $AnswerDtoCopyWith<$Res> {
  _$AnswerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? ordinal = null,
    Object? correct = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      ordinal: null == ordinal
          ? _value.ordinal
          : ordinal // ignore: cast_nullable_to_non_nullable
              as int,
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerDtoImplCopyWith<$Res>
    implements $AnswerDtoCopyWith<$Res> {
  factory _$$AnswerDtoImplCopyWith(
          _$AnswerDtoImpl value, $Res Function(_$AnswerDtoImpl) then) =
      __$$AnswerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String id,
      @JsonKey(defaultValue: '') String answer,
      @JsonKey(defaultValue: -1) int ordinal,
      @JsonKey(defaultValue: false) bool correct});
}

/// @nodoc
class __$$AnswerDtoImplCopyWithImpl<$Res>
    extends _$AnswerDtoCopyWithImpl<$Res, _$AnswerDtoImpl>
    implements _$$AnswerDtoImplCopyWith<$Res> {
  __$$AnswerDtoImplCopyWithImpl(
      _$AnswerDtoImpl _value, $Res Function(_$AnswerDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? ordinal = null,
    Object? correct = null,
  }) {
    return _then(_$AnswerDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      ordinal: null == ordinal
          ? _value.ordinal
          : ordinal // ignore: cast_nullable_to_non_nullable
              as int,
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$AnswerDtoImpl implements _AnswerDto {
  const _$AnswerDtoImpl(
      {@JsonKey(defaultValue: '') this.id = '',
      @JsonKey(defaultValue: '') this.answer = '',
      @JsonKey(defaultValue: -1) this.ordinal = -1,
      @JsonKey(defaultValue: false) this.correct = false});

  @override
  @JsonKey(defaultValue: '')
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String answer;
  @override
  @JsonKey(defaultValue: -1)
  final int ordinal;
  @override
  @JsonKey(defaultValue: false)
  final bool correct;

  @override
  String toString() {
    return 'AnswerDto(id: $id, answer: $answer, ordinal: $ordinal, correct: $correct)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.ordinal, ordinal) || other.ordinal == ordinal) &&
            (identical(other.correct, correct) || other.correct == correct));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, answer, ordinal, correct);

  /// Create a copy of AnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerDtoImplCopyWith<_$AnswerDtoImpl> get copyWith =>
      __$$AnswerDtoImplCopyWithImpl<_$AnswerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerDtoImplToJson(
      this,
    );
  }
}

abstract class _AnswerDto implements AnswerDto {
  const factory _AnswerDto(
      {@JsonKey(defaultValue: '') final String id,
      @JsonKey(defaultValue: '') final String answer,
      @JsonKey(defaultValue: -1) final int ordinal,
      @JsonKey(defaultValue: false) final bool correct}) = _$AnswerDtoImpl;

  @override
  @JsonKey(defaultValue: '')
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get answer;
  @override
  @JsonKey(defaultValue: -1)
  int get ordinal;
  @override
  @JsonKey(defaultValue: false)
  bool get correct;

  /// Create a copy of AnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerDtoImplCopyWith<_$AnswerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
