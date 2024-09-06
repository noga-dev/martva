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
