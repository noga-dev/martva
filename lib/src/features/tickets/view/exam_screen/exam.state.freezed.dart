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
  List<UserAnswer> get userAnswers => throw _privateConstructorUsedError;
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
      List<UserAnswer> userAnswers,
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
              as List<UserAnswer>,
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
      List<UserAnswer> userAnswers,
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
              as List<UserAnswer>,
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
      {required this.tickets,
      required this.currentQuestionIndex,
      required final List<UserAnswer> userAnswers,
      required this.timeLeft})
      : _userAnswers = userAnswers;

  @override
  final AsyncValue<List<TicketDto>> tickets;
  @override
  final int currentQuestionIndex;
  final List<UserAnswer> _userAnswers;
  @override
  List<UserAnswer> get userAnswers {
    if (_userAnswers is EqualUnmodifiableListView) return _userAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userAnswers);
  }

  @override
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
      {required final AsyncValue<List<TicketDto>> tickets,
      required final int currentQuestionIndex,
      required final List<UserAnswer> userAnswers,
      required final Duration timeLeft}) = _$ExamStateImpl;

  @override
  AsyncValue<List<TicketDto>> get tickets;
  @override
  int get currentQuestionIndex;
  @override
  List<UserAnswer> get userAnswers;
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
mixin _$UserAnswer {
  TicketDto get ticket => throw _privateConstructorUsedError;
  int? get selectedAnswerIndex => throw _privateConstructorUsedError;
  AnswerDto? get selectedAnswer => throw _privateConstructorUsedError;
  bool get showExplanation => throw _privateConstructorUsedError;

  /// Create a copy of UserAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAnswerCopyWith<UserAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAnswerCopyWith<$Res> {
  factory $UserAnswerCopyWith(
          UserAnswer value, $Res Function(UserAnswer) then) =
      _$UserAnswerCopyWithImpl<$Res, UserAnswer>;
  @useResult
  $Res call(
      {TicketDto ticket,
      int? selectedAnswerIndex,
      AnswerDto? selectedAnswer,
      bool showExplanation});

  $TicketDtoCopyWith<$Res> get ticket;
  $AnswerDtoCopyWith<$Res>? get selectedAnswer;
}

/// @nodoc
class _$UserAnswerCopyWithImpl<$Res, $Val extends UserAnswer>
    implements $UserAnswerCopyWith<$Res> {
  _$UserAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticket = null,
    Object? selectedAnswerIndex = freezed,
    Object? selectedAnswer = freezed,
    Object? showExplanation = null,
  }) {
    return _then(_value.copyWith(
      ticket: null == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as TicketDto,
      selectedAnswerIndex: freezed == selectedAnswerIndex
          ? _value.selectedAnswerIndex
          : selectedAnswerIndex // ignore: cast_nullable_to_non_nullable
              as int?,
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

  /// Create a copy of UserAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TicketDtoCopyWith<$Res> get ticket {
    return $TicketDtoCopyWith<$Res>(_value.ticket, (value) {
      return _then(_value.copyWith(ticket: value) as $Val);
    });
  }

  /// Create a copy of UserAnswer
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
abstract class _$$UserAnswerImplCopyWith<$Res>
    implements $UserAnswerCopyWith<$Res> {
  factory _$$UserAnswerImplCopyWith(
          _$UserAnswerImpl value, $Res Function(_$UserAnswerImpl) then) =
      __$$UserAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TicketDto ticket,
      int? selectedAnswerIndex,
      AnswerDto? selectedAnswer,
      bool showExplanation});

  @override
  $TicketDtoCopyWith<$Res> get ticket;
  @override
  $AnswerDtoCopyWith<$Res>? get selectedAnswer;
}

/// @nodoc
class __$$UserAnswerImplCopyWithImpl<$Res>
    extends _$UserAnswerCopyWithImpl<$Res, _$UserAnswerImpl>
    implements _$$UserAnswerImplCopyWith<$Res> {
  __$$UserAnswerImplCopyWithImpl(
      _$UserAnswerImpl _value, $Res Function(_$UserAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticket = null,
    Object? selectedAnswerIndex = freezed,
    Object? selectedAnswer = freezed,
    Object? showExplanation = null,
  }) {
    return _then(_$UserAnswerImpl(
      ticket: null == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as TicketDto,
      selectedAnswerIndex: freezed == selectedAnswerIndex
          ? _value.selectedAnswerIndex
          : selectedAnswerIndex // ignore: cast_nullable_to_non_nullable
              as int?,
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

class _$UserAnswerImpl implements _UserAnswer {
  const _$UserAnswerImpl(
      {required this.ticket,
      this.selectedAnswerIndex,
      this.selectedAnswer,
      this.showExplanation = false});

  @override
  final TicketDto ticket;
  @override
  final int? selectedAnswerIndex;
  @override
  final AnswerDto? selectedAnswer;
  @override
  @JsonKey()
  final bool showExplanation;

  @override
  String toString() {
    return 'UserAnswer(ticket: $ticket, selectedAnswerIndex: $selectedAnswerIndex, selectedAnswer: $selectedAnswer, showExplanation: $showExplanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAnswerImpl &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            (identical(other.selectedAnswerIndex, selectedAnswerIndex) ||
                other.selectedAnswerIndex == selectedAnswerIndex) &&
            (identical(other.selectedAnswer, selectedAnswer) ||
                other.selectedAnswer == selectedAnswer) &&
            (identical(other.showExplanation, showExplanation) ||
                other.showExplanation == showExplanation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticket, selectedAnswerIndex,
      selectedAnswer, showExplanation);

  /// Create a copy of UserAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAnswerImplCopyWith<_$UserAnswerImpl> get copyWith =>
      __$$UserAnswerImplCopyWithImpl<_$UserAnswerImpl>(this, _$identity);
}

abstract class _UserAnswer implements UserAnswer {
  const factory _UserAnswer(
      {required final TicketDto ticket,
      final int? selectedAnswerIndex,
      final AnswerDto? selectedAnswer,
      final bool showExplanation}) = _$UserAnswerImpl;

  @override
  TicketDto get ticket;
  @override
  int? get selectedAnswerIndex;
  @override
  AnswerDto? get selectedAnswer;
  @override
  bool get showExplanation;

  /// Create a copy of UserAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAnswerImplCopyWith<_$UserAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
