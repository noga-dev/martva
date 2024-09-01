// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TicketDto {
  @JsonKey(defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0, name: 'ordinal_id')
  int get ordinalId => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get question => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get explanation => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<AnswerDto> get answers => throw _privateConstructorUsedError;

  /// Serializes this TicketDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketDtoCopyWith<TicketDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketDtoCopyWith<$Res> {
  factory $TicketDtoCopyWith(TicketDto value, $Res Function(TicketDto) then) =
      _$TicketDtoCopyWithImpl<$Res, TicketDto>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String id,
      @JsonKey(defaultValue: 0, name: 'ordinal_id') int ordinalId,
      @JsonKey(defaultValue: '') String question,
      @JsonKey(defaultValue: '') String explanation,
      @JsonKey(defaultValue: '') String image,
      @JsonKey(defaultValue: []) List<AnswerDto> answers});
}

/// @nodoc
class _$TicketDtoCopyWithImpl<$Res, $Val extends TicketDto>
    implements $TicketDtoCopyWith<$Res> {
  _$TicketDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ordinalId = null,
    Object? question = null,
    Object? explanation = null,
    Object? image = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ordinalId: null == ordinalId
          ? _value.ordinalId
          : ordinalId // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketDtoImplCopyWith<$Res>
    implements $TicketDtoCopyWith<$Res> {
  factory _$$TicketDtoImplCopyWith(
          _$TicketDtoImpl value, $Res Function(_$TicketDtoImpl) then) =
      __$$TicketDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String id,
      @JsonKey(defaultValue: 0, name: 'ordinal_id') int ordinalId,
      @JsonKey(defaultValue: '') String question,
      @JsonKey(defaultValue: '') String explanation,
      @JsonKey(defaultValue: '') String image,
      @JsonKey(defaultValue: []) List<AnswerDto> answers});
}

/// @nodoc
class __$$TicketDtoImplCopyWithImpl<$Res>
    extends _$TicketDtoCopyWithImpl<$Res, _$TicketDtoImpl>
    implements _$$TicketDtoImplCopyWith<$Res> {
  __$$TicketDtoImplCopyWithImpl(
      _$TicketDtoImpl _value, $Res Function(_$TicketDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ordinalId = null,
    Object? question = null,
    Object? explanation = null,
    Object? image = null,
    Object? answers = null,
  }) {
    return _then(_$TicketDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ordinalId: null == ordinalId
          ? _value.ordinalId
          : ordinalId // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$TicketDtoImpl implements _TicketDto {
  const _$TicketDtoImpl(
      {@JsonKey(defaultValue: '') this.id = '',
      @JsonKey(defaultValue: 0, name: 'ordinal_id') this.ordinalId = 0,
      @JsonKey(defaultValue: '') this.question = '',
      @JsonKey(defaultValue: '') this.explanation = '',
      @JsonKey(defaultValue: '') this.image = '',
      @JsonKey(defaultValue: []) final List<AnswerDto> answers = const []})
      : _answers = answers;

  @override
  @JsonKey(defaultValue: '')
  final String id;
  @override
  @JsonKey(defaultValue: 0, name: 'ordinal_id')
  final int ordinalId;
  @override
  @JsonKey(defaultValue: '')
  final String question;
  @override
  @JsonKey(defaultValue: '')
  final String explanation;
  @override
  @JsonKey(defaultValue: '')
  final String image;
  final List<AnswerDto> _answers;
  @override
  @JsonKey(defaultValue: [])
  List<AnswerDto> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'TicketDto(id: $id, ordinalId: $ordinalId, question: $question, explanation: $explanation, image: $image, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ordinalId, ordinalId) ||
                other.ordinalId == ordinalId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, ordinalId, question,
      explanation, image, const DeepCollectionEquality().hash(_answers));

  /// Create a copy of TicketDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketDtoImplCopyWith<_$TicketDtoImpl> get copyWith =>
      __$$TicketDtoImplCopyWithImpl<_$TicketDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketDtoImplToJson(
      this,
    );
  }
}

abstract class _TicketDto implements TicketDto {
  const factory _TicketDto(
          {@JsonKey(defaultValue: '') final String id,
          @JsonKey(defaultValue: 0, name: 'ordinal_id') final int ordinalId,
          @JsonKey(defaultValue: '') final String question,
          @JsonKey(defaultValue: '') final String explanation,
          @JsonKey(defaultValue: '') final String image,
          @JsonKey(defaultValue: []) final List<AnswerDto> answers}) =
      _$TicketDtoImpl;

  @override
  @JsonKey(defaultValue: '')
  String get id;
  @override
  @JsonKey(defaultValue: 0, name: 'ordinal_id')
  int get ordinalId;
  @override
  @JsonKey(defaultValue: '')
  String get question;
  @override
  @JsonKey(defaultValue: '')
  String get explanation;
  @override
  @JsonKey(defaultValue: '')
  String get image;
  @override
  @JsonKey(defaultValue: [])
  List<AnswerDto> get answers;

  /// Create a copy of TicketDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketDtoImplCopyWith<_$TicketDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
