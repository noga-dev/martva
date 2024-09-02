// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExamState {
  AsyncValue<List<TicketDto>> get tickets => throw _privateConstructorUsedError;
  int get currentQuestionIndex => throw _privateConstructorUsedError;
  List<QuestionResponse> get userAnswers => throw _privateConstructorUsedError;
  Duration get timeLeft => throw _privateConstructorUsedError;

  /// Create a copy of ExamState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamStateCopyWith<ExamState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamStateCopyWith<$Res> {
  factory $ExamStateCopyWith(ExamState value, $Res Function(ExamState) then) =
      _$ExamStateCopyWithImpl<$Res, ExamState>;
  @useResult
  $Res call(
      {AsyncValue<List<TicketDto>> tickets,
      int currentQuestionIndex,
      List<QuestionResponse> userAnswers,
      Duration timeLeft});
}

/// @nodoc
class _$ExamStateCopyWithImpl<$Res, $Val extends ExamState>
    implements $ExamStateCopyWith<$Res> {
  _$ExamStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
    Object? currentQuestionIndex = null,
    Object? userAnswers = null,
    Object? timeLeft = null,
  }) {
    return _then(_value.copyWith(
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TicketDto>>,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      userAnswers: null == userAnswers
          ? _value.userAnswers
          : userAnswers // ignore: cast_nullable_to_non_nullable
              as List<QuestionResponse>,
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExamStateImplCopyWith<$Res>
    implements $ExamStateCopyWith<$Res> {
  factory _$$ExamStateImplCopyWith(
          _$ExamStateImpl value, $Res Function(_$ExamStateImpl) then) =
      __$$ExamStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<TicketDto>> tickets,
      int currentQuestionIndex,
      List<QuestionResponse> userAnswers,
      Duration timeLeft});
}

/// @nodoc
class __$$ExamStateImplCopyWithImpl<$Res>
    extends _$ExamStateCopyWithImpl<$Res, _$ExamStateImpl>
    implements _$$ExamStateImplCopyWith<$Res> {
  __$$ExamStateImplCopyWithImpl(
      _$ExamStateImpl _value, $Res Function(_$ExamStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
    Object? currentQuestionIndex = null,
    Object? userAnswers = null,
    Object? timeLeft = null,
  }) {
    return _then(_$ExamStateImpl(
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TicketDto>>,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      userAnswers: null == userAnswers
          ? _value._userAnswers
          : userAnswers // ignore: cast_nullable_to_non_nullable
              as List<QuestionResponse>,
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$ExamStateImpl implements _ExamState {
  const _$ExamStateImpl(
      {this.tickets = const AsyncValue.loading(),
      this.currentQuestionIndex = 0,
      final List<QuestionResponse> userAnswers = const [],
      this.timeLeft = const Duration(minutes: 30)})
      : _userAnswers = userAnswers;

  @override
  @JsonKey()
  final AsyncValue<List<TicketDto>> tickets;
  @override
  @JsonKey()
  final int currentQuestionIndex;
  final List<QuestionResponse> _userAnswers;
  @override
  @JsonKey()
  List<QuestionResponse> get userAnswers {
    if (_userAnswers is EqualUnmodifiableListView) return _userAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userAnswers);
  }

  @override
  @JsonKey()
  final Duration timeLeft;

  @override
  String toString() {
    return 'ExamState(tickets: $tickets, currentQuestionIndex: $currentQuestionIndex, userAnswers: $userAnswers, timeLeft: $timeLeft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamStateImpl &&
            (identical(other.tickets, tickets) || other.tickets == tickets) &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            const DeepCollectionEquality()
                .equals(other._userAnswers, _userAnswers) &&
            (identical(other.timeLeft, timeLeft) ||
                other.timeLeft == timeLeft));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tickets, currentQuestionIndex,
      const DeepCollectionEquality().hash(_userAnswers), timeLeft);

  /// Create a copy of ExamState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamStateImplCopyWith<_$ExamStateImpl> get copyWith =>
      __$$ExamStateImplCopyWithImpl<_$ExamStateImpl>(this, _$identity);
}

abstract class _ExamState implements ExamState {
  const factory _ExamState(
      {final AsyncValue<List<TicketDto>> tickets,
      final int currentQuestionIndex,
      final List<QuestionResponse> userAnswers,
      final Duration timeLeft}) = _$ExamStateImpl;

  @override
  AsyncValue<List<TicketDto>> get tickets;
  @override
  int get currentQuestionIndex;
  @override
  List<QuestionResponse> get userAnswers;
  @override
  Duration get timeLeft;

  /// Create a copy of ExamState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamStateImplCopyWith<_$ExamStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QuestionResponse {
  TicketDto get ticket => throw _privateConstructorUsedError;
  AnswerDto? get selectedAnswer => throw _privateConstructorUsedError;
  bool get showExplanation => throw _privateConstructorUsedError;

  /// Create a copy of QuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionResponseCopyWith<QuestionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionResponseCopyWith<$Res> {
  factory $QuestionResponseCopyWith(
          QuestionResponse value, $Res Function(QuestionResponse) then) =
      _$QuestionResponseCopyWithImpl<$Res, QuestionResponse>;
  @useResult
  $Res call(
      {TicketDto ticket, AnswerDto? selectedAnswer, bool showExplanation});

  $TicketDtoCopyWith<$Res> get ticket;
  $AnswerDtoCopyWith<$Res>? get selectedAnswer;
}

/// @nodoc
class _$QuestionResponseCopyWithImpl<$Res, $Val extends QuestionResponse>
    implements $QuestionResponseCopyWith<$Res> {
  _$QuestionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticket = null,
    Object? selectedAnswer = freezed,
    Object? showExplanation = null,
  }) {
    return _then(_value.copyWith(
      ticket: null == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as TicketDto,
      selectedAnswer: freezed == selectedAnswer
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as AnswerDto?,
      showExplanation: null == showExplanation
          ? _value.showExplanation
          : showExplanation // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of QuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TicketDtoCopyWith<$Res> get ticket {
    return $TicketDtoCopyWith<$Res>(_value.ticket, (value) {
      return _then(_value.copyWith(ticket: value) as $Val);
    });
  }

  /// Create a copy of QuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnswerDtoCopyWith<$Res>? get selectedAnswer {
    if (_value.selectedAnswer == null) {
      return null;
    }

    return $AnswerDtoCopyWith<$Res>(_value.selectedAnswer!, (value) {
      return _then(_value.copyWith(selectedAnswer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuestionResponseImplCopyWith<$Res>
    implements $QuestionResponseCopyWith<$Res> {
  factory _$$QuestionResponseImplCopyWith(_$QuestionResponseImpl value,
          $Res Function(_$QuestionResponseImpl) then) =
      __$$QuestionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TicketDto ticket, AnswerDto? selectedAnswer, bool showExplanation});

  @override
  $TicketDtoCopyWith<$Res> get ticket;
  @override
  $AnswerDtoCopyWith<$Res>? get selectedAnswer;
}

/// @nodoc
class __$$QuestionResponseImplCopyWithImpl<$Res>
    extends _$QuestionResponseCopyWithImpl<$Res, _$QuestionResponseImpl>
    implements _$$QuestionResponseImplCopyWith<$Res> {
  __$$QuestionResponseImplCopyWithImpl(_$QuestionResponseImpl _value,
      $Res Function(_$QuestionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticket = null,
    Object? selectedAnswer = freezed,
    Object? showExplanation = null,
  }) {
    return _then(_$QuestionResponseImpl(
      ticket: null == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as TicketDto,
      selectedAnswer: freezed == selectedAnswer
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as AnswerDto?,
      showExplanation: null == showExplanation
          ? _value.showExplanation
          : showExplanation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$QuestionResponseImpl implements _QuestionResponse {
  const _$QuestionResponseImpl(
      {required this.ticket,
      this.selectedAnswer,
      this.showExplanation = false});

  @override
  final TicketDto ticket;
  @override
  final AnswerDto? selectedAnswer;
  @override
  @JsonKey()
  final bool showExplanation;

  @override
  String toString() {
    return 'QuestionResponse(ticket: $ticket, selectedAnswer: $selectedAnswer, showExplanation: $showExplanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionResponseImpl &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            (identical(other.selectedAnswer, selectedAnswer) ||
                other.selectedAnswer == selectedAnswer) &&
            (identical(other.showExplanation, showExplanation) ||
                other.showExplanation == showExplanation));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ticket, selectedAnswer, showExplanation);

  /// Create a copy of QuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionResponseImplCopyWith<_$QuestionResponseImpl> get copyWith =>
      __$$QuestionResponseImplCopyWithImpl<_$QuestionResponseImpl>(
          this, _$identity);
}

abstract class _QuestionResponse implements QuestionResponse {
  const factory _QuestionResponse(
      {required final TicketDto ticket,
      final AnswerDto? selectedAnswer,
      final bool showExplanation}) = _$QuestionResponseImpl;

  @override
  TicketDto get ticket;
  @override
  AnswerDto? get selectedAnswer;
  @override
  bool get showExplanation;

  /// Create a copy of QuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionResponseImplCopyWith<_$QuestionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
