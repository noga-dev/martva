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
  int get currentQuestionIndex => throw _privateConstructorUsedError;
  Duration get timeLeft => throw _privateConstructorUsedError;
  List<QuestionState> get solutions => throw _privateConstructorUsedError;

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
      {int currentQuestionIndex,
      Duration timeLeft,
      List<QuestionState> solutions});
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
    Object? currentQuestionIndex = null,
    Object? timeLeft = null,
    Object? solutions = null,
  }) {
    return _then(_value.copyWith(
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as Duration,
      solutions: null == solutions
          ? _value.solutions
          : solutions // ignore: cast_nullable_to_non_nullable
              as List<QuestionState>,
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
      {int currentQuestionIndex,
      Duration timeLeft,
      List<QuestionState> solutions});
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
    Object? currentQuestionIndex = null,
    Object? timeLeft = null,
    Object? solutions = null,
  }) {
    return _then(_$ExamStateImpl(
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as Duration,
      solutions: null == solutions
          ? _value._solutions
          : solutions // ignore: cast_nullable_to_non_nullable
              as List<QuestionState>,
    ));
  }
}

/// @nodoc

class _$ExamStateImpl implements _ExamState {
  const _$ExamStateImpl(
      {this.currentQuestionIndex = 0,
      this.timeLeft = Constants.examTicketsTime,
      final List<QuestionState> solutions = const []})
      : _solutions = solutions;

  @override
  @JsonKey()
  final int currentQuestionIndex;
  @override
  @JsonKey()
  final Duration timeLeft;
  final List<QuestionState> _solutions;
  @override
  @JsonKey()
  List<QuestionState> get solutions {
    if (_solutions is EqualUnmodifiableListView) return _solutions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_solutions);
  }

  @override
  String toString() {
    return 'ExamState(currentQuestionIndex: $currentQuestionIndex, timeLeft: $timeLeft, solutions: $solutions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamStateImpl &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            (identical(other.timeLeft, timeLeft) ||
                other.timeLeft == timeLeft) &&
            const DeepCollectionEquality()
                .equals(other._solutions, _solutions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentQuestionIndex, timeLeft,
      const DeepCollectionEquality().hash(_solutions));

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
      {final int currentQuestionIndex,
      final Duration timeLeft,
      final List<QuestionState> solutions}) = _$ExamStateImpl;

  @override
  int get currentQuestionIndex;
  @override
  Duration get timeLeft;
  @override
  List<QuestionState> get solutions;

  /// Create a copy of ExamState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamStateImplCopyWith<_$ExamStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QuestionState {
  TicketDto get ticket => throw _privateConstructorUsedError;
  AnswerDto? get selectedAnswer => throw _privateConstructorUsedError;
  bool get showExplanation => throw _privateConstructorUsedError;

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionStateCopyWith<QuestionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionStateCopyWith<$Res> {
  factory $QuestionStateCopyWith(
          QuestionState value, $Res Function(QuestionState) then) =
      _$QuestionStateCopyWithImpl<$Res, QuestionState>;
  @useResult
  $Res call(
      {TicketDto ticket, AnswerDto? selectedAnswer, bool showExplanation});

  $TicketDtoCopyWith<$Res> get ticket;
  $AnswerDtoCopyWith<$Res>? get selectedAnswer;
}

/// @nodoc
class _$QuestionStateCopyWithImpl<$Res, $Val extends QuestionState>
    implements $QuestionStateCopyWith<$Res> {
  _$QuestionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionState
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

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TicketDtoCopyWith<$Res> get ticket {
    return $TicketDtoCopyWith<$Res>(_value.ticket, (value) {
      return _then(_value.copyWith(ticket: value) as $Val);
    });
  }

  /// Create a copy of QuestionState
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
abstract class _$$QuestionStateImplCopyWith<$Res>
    implements $QuestionStateCopyWith<$Res> {
  factory _$$QuestionStateImplCopyWith(
          _$QuestionStateImpl value, $Res Function(_$QuestionStateImpl) then) =
      __$$QuestionStateImplCopyWithImpl<$Res>;
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
class __$$QuestionStateImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionStateImpl>
    implements _$$QuestionStateImplCopyWith<$Res> {
  __$$QuestionStateImplCopyWithImpl(
      _$QuestionStateImpl _value, $Res Function(_$QuestionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticket = null,
    Object? selectedAnswer = freezed,
    Object? showExplanation = null,
  }) {
    return _then(_$QuestionStateImpl(
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

class _$QuestionStateImpl implements _QuestionState {
  const _$QuestionStateImpl(
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
    return 'QuestionState(ticket: $ticket, selectedAnswer: $selectedAnswer, showExplanation: $showExplanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionStateImpl &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            (identical(other.selectedAnswer, selectedAnswer) ||
                other.selectedAnswer == selectedAnswer) &&
            (identical(other.showExplanation, showExplanation) ||
                other.showExplanation == showExplanation));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ticket, selectedAnswer, showExplanation);

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionStateImplCopyWith<_$QuestionStateImpl> get copyWith =>
      __$$QuestionStateImplCopyWithImpl<_$QuestionStateImpl>(this, _$identity);
}

abstract class _QuestionState implements QuestionState {
  const factory _QuestionState(
      {required final TicketDto ticket,
      final AnswerDto? selectedAnswer,
      final bool showExplanation}) = _$QuestionStateImpl;

  @override
  TicketDto get ticket;
  @override
  AnswerDto? get selectedAnswer;
  @override
  bool get showExplanation;

  /// Create a copy of QuestionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionStateImplCopyWith<_$QuestionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
