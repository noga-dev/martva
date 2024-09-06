// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_details.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TicketDetailsState {
  QuestionState get solution => throw _privateConstructorUsedError;

  /// Create a copy of TicketDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketDetailsStateCopyWith<TicketDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketDetailsStateCopyWith<$Res> {
  factory $TicketDetailsStateCopyWith(
          TicketDetailsState value, $Res Function(TicketDetailsState) then) =
      _$TicketDetailsStateCopyWithImpl<$Res, TicketDetailsState>;
  @useResult
  $Res call({QuestionState solution});

  $QuestionStateCopyWith<$Res> get solution;
}

/// @nodoc
class _$TicketDetailsStateCopyWithImpl<$Res, $Val extends TicketDetailsState>
    implements $TicketDetailsStateCopyWith<$Res> {
  _$TicketDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? solution = null,
  }) {
    return _then(_value.copyWith(
      solution: null == solution
          ? _value.solution
          : solution // ignore: cast_nullable_to_non_nullable
              as QuestionState,
    ) as $Val);
  }

  /// Create a copy of TicketDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestionStateCopyWith<$Res> get solution {
    return $QuestionStateCopyWith<$Res>(_value.solution, (value) {
      return _then(_value.copyWith(solution: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TicketDetailsStateImplCopyWith<$Res>
    implements $TicketDetailsStateCopyWith<$Res> {
  factory _$$TicketDetailsStateImplCopyWith(_$TicketDetailsStateImpl value,
          $Res Function(_$TicketDetailsStateImpl) then) =
      __$$TicketDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({QuestionState solution});

  @override
  $QuestionStateCopyWith<$Res> get solution;
}

/// @nodoc
class __$$TicketDetailsStateImplCopyWithImpl<$Res>
    extends _$TicketDetailsStateCopyWithImpl<$Res, _$TicketDetailsStateImpl>
    implements _$$TicketDetailsStateImplCopyWith<$Res> {
  __$$TicketDetailsStateImplCopyWithImpl(_$TicketDetailsStateImpl _value,
      $Res Function(_$TicketDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? solution = null,
  }) {
    return _then(_$TicketDetailsStateImpl(
      solution: null == solution
          ? _value.solution
          : solution // ignore: cast_nullable_to_non_nullable
              as QuestionState,
    ));
  }
}

/// @nodoc

class _$TicketDetailsStateImpl implements _TicketDetailsState {
  const _$TicketDetailsStateImpl(
      {this.solution = const QuestionState(ticket: TicketDto())});

  @override
  @JsonKey()
  final QuestionState solution;

  @override
  String toString() {
    return 'TicketDetailsState(solution: $solution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketDetailsStateImpl &&
            (identical(other.solution, solution) ||
                other.solution == solution));
  }

  @override
  int get hashCode => Object.hash(runtimeType, solution);

  /// Create a copy of TicketDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketDetailsStateImplCopyWith<_$TicketDetailsStateImpl> get copyWith =>
      __$$TicketDetailsStateImplCopyWithImpl<_$TicketDetailsStateImpl>(
          this, _$identity);
}

abstract class _TicketDetailsState implements TicketDetailsState {
  const factory _TicketDetailsState({final QuestionState solution}) =
      _$TicketDetailsStateImpl;

  @override
  QuestionState get solution;

  /// Create a copy of TicketDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketDetailsStateImplCopyWith<_$TicketDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
