// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcards.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FlashcardsState {
  List<TicketDto> get tickets => throw _privateConstructorUsedError;
  List<FlashcardDto> get dueFlashcards => throw _privateConstructorUsedError;
  int? get currentTicketIndex => throw _privateConstructorUsedError;
  int? get currentFlashcardIndex => throw _privateConstructorUsedError;

  /// Create a copy of FlashcardsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlashcardsStateCopyWith<FlashcardsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardsStateCopyWith<$Res> {
  factory $FlashcardsStateCopyWith(
          FlashcardsState value, $Res Function(FlashcardsState) then) =
      _$FlashcardsStateCopyWithImpl<$Res, FlashcardsState>;
  @useResult
  $Res call(
      {List<TicketDto> tickets,
      List<FlashcardDto> dueFlashcards,
      int? currentTicketIndex,
      int? currentFlashcardIndex});
}

/// @nodoc
class _$FlashcardsStateCopyWithImpl<$Res, $Val extends FlashcardsState>
    implements $FlashcardsStateCopyWith<$Res> {
  _$FlashcardsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlashcardsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
    Object? dueFlashcards = null,
    Object? currentTicketIndex = freezed,
    Object? currentFlashcardIndex = freezed,
  }) {
    return _then(_value.copyWith(
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketDto>,
      dueFlashcards: null == dueFlashcards
          ? _value.dueFlashcards
          : dueFlashcards // ignore: cast_nullable_to_non_nullable
              as List<FlashcardDto>,
      currentTicketIndex: freezed == currentTicketIndex
          ? _value.currentTicketIndex
          : currentTicketIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      currentFlashcardIndex: freezed == currentFlashcardIndex
          ? _value.currentFlashcardIndex
          : currentFlashcardIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlashcardsStateImplCopyWith<$Res>
    implements $FlashcardsStateCopyWith<$Res> {
  factory _$$FlashcardsStateImplCopyWith(_$FlashcardsStateImpl value,
          $Res Function(_$FlashcardsStateImpl) then) =
      __$$FlashcardsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TicketDto> tickets,
      List<FlashcardDto> dueFlashcards,
      int? currentTicketIndex,
      int? currentFlashcardIndex});
}

/// @nodoc
class __$$FlashcardsStateImplCopyWithImpl<$Res>
    extends _$FlashcardsStateCopyWithImpl<$Res, _$FlashcardsStateImpl>
    implements _$$FlashcardsStateImplCopyWith<$Res> {
  __$$FlashcardsStateImplCopyWithImpl(
      _$FlashcardsStateImpl _value, $Res Function(_$FlashcardsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlashcardsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
    Object? dueFlashcards = null,
    Object? currentTicketIndex = freezed,
    Object? currentFlashcardIndex = freezed,
  }) {
    return _then(_$FlashcardsStateImpl(
      tickets: null == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketDto>,
      dueFlashcards: null == dueFlashcards
          ? _value._dueFlashcards
          : dueFlashcards // ignore: cast_nullable_to_non_nullable
              as List<FlashcardDto>,
      currentTicketIndex: freezed == currentTicketIndex
          ? _value.currentTicketIndex
          : currentTicketIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      currentFlashcardIndex: freezed == currentFlashcardIndex
          ? _value.currentFlashcardIndex
          : currentFlashcardIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FlashcardsStateImpl implements _FlashcardsState {
  const _$FlashcardsStateImpl(
      {final List<TicketDto> tickets = const [],
      final List<FlashcardDto> dueFlashcards = const [],
      this.currentTicketIndex,
      this.currentFlashcardIndex})
      : _tickets = tickets,
        _dueFlashcards = dueFlashcards;

  final List<TicketDto> _tickets;
  @override
  @JsonKey()
  List<TicketDto> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  final List<FlashcardDto> _dueFlashcards;
  @override
  @JsonKey()
  List<FlashcardDto> get dueFlashcards {
    if (_dueFlashcards is EqualUnmodifiableListView) return _dueFlashcards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dueFlashcards);
  }

  @override
  final int? currentTicketIndex;
  @override
  final int? currentFlashcardIndex;

  @override
  String toString() {
    return 'FlashcardsState(tickets: $tickets, dueFlashcards: $dueFlashcards, currentTicketIndex: $currentTicketIndex, currentFlashcardIndex: $currentFlashcardIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashcardsStateImpl &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            const DeepCollectionEquality()
                .equals(other._dueFlashcards, _dueFlashcards) &&
            (identical(other.currentTicketIndex, currentTicketIndex) ||
                other.currentTicketIndex == currentTicketIndex) &&
            (identical(other.currentFlashcardIndex, currentFlashcardIndex) ||
                other.currentFlashcardIndex == currentFlashcardIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tickets),
      const DeepCollectionEquality().hash(_dueFlashcards),
      currentTicketIndex,
      currentFlashcardIndex);

  /// Create a copy of FlashcardsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashcardsStateImplCopyWith<_$FlashcardsStateImpl> get copyWith =>
      __$$FlashcardsStateImplCopyWithImpl<_$FlashcardsStateImpl>(
          this, _$identity);
}

abstract class _FlashcardsState implements FlashcardsState {
  const factory _FlashcardsState(
      {final List<TicketDto> tickets,
      final List<FlashcardDto> dueFlashcards,
      final int? currentTicketIndex,
      final int? currentFlashcardIndex}) = _$FlashcardsStateImpl;

  @override
  List<TicketDto> get tickets;
  @override
  List<FlashcardDto> get dueFlashcards;
  @override
  int? get currentTicketIndex;
  @override
  int? get currentFlashcardIndex;

  /// Create a copy of FlashcardsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlashcardsStateImplCopyWith<_$FlashcardsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
