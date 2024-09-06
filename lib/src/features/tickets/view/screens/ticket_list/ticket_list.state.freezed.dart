// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_list.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TicketListState {
  int get currentQuestionIndex => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  List<TicketDto> get tickets => throw _privateConstructorUsedError;

  /// Create a copy of TicketListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketListStateCopyWith<TicketListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketListStateCopyWith<$Res> {
  factory $TicketListStateCopyWith(
          TicketListState value, $Res Function(TicketListState) then) =
      _$TicketListStateCopyWithImpl<$Res, TicketListState>;
  @useResult
  $Res call(
      {int currentQuestionIndex,
      int totalCount,
      int limit,
      int page,
      List<TicketDto> tickets});
}

/// @nodoc
class _$TicketListStateCopyWithImpl<$Res, $Val extends TicketListState>
    implements $TicketListStateCopyWith<$Res> {
  _$TicketListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentQuestionIndex = null,
    Object? totalCount = null,
    Object? limit = null,
    Object? page = null,
    Object? tickets = null,
  }) {
    return _then(_value.copyWith(
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketListStateImplCopyWith<$Res>
    implements $TicketListStateCopyWith<$Res> {
  factory _$$TicketListStateImplCopyWith(_$TicketListStateImpl value,
          $Res Function(_$TicketListStateImpl) then) =
      __$$TicketListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentQuestionIndex,
      int totalCount,
      int limit,
      int page,
      List<TicketDto> tickets});
}

/// @nodoc
class __$$TicketListStateImplCopyWithImpl<$Res>
    extends _$TicketListStateCopyWithImpl<$Res, _$TicketListStateImpl>
    implements _$$TicketListStateImplCopyWith<$Res> {
  __$$TicketListStateImplCopyWithImpl(
      _$TicketListStateImpl _value, $Res Function(_$TicketListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentQuestionIndex = null,
    Object? totalCount = null,
    Object? limit = null,
    Object? page = null,
    Object? tickets = null,
  }) {
    return _then(_$TicketListStateImpl(
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      tickets: null == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketDto>,
    ));
  }
}

/// @nodoc

class _$TicketListStateImpl implements _TicketListState {
  const _$TicketListStateImpl(
      {this.currentQuestionIndex = 0,
      this.totalCount = 0,
      this.limit = Constants.ticketListLimit,
      this.page = 1,
      final List<TicketDto> tickets = const []})
      : _tickets = tickets;

  @override
  @JsonKey()
  final int currentQuestionIndex;
  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int page;
  final List<TicketDto> _tickets;
  @override
  @JsonKey()
  List<TicketDto> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  @override
  String toString() {
    return 'TicketListState(currentQuestionIndex: $currentQuestionIndex, totalCount: $totalCount, limit: $limit, page: $page, tickets: $tickets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketListStateImpl &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._tickets, _tickets));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentQuestionIndex, totalCount,
      limit, page, const DeepCollectionEquality().hash(_tickets));

  /// Create a copy of TicketListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketListStateImplCopyWith<_$TicketListStateImpl> get copyWith =>
      __$$TicketListStateImplCopyWithImpl<_$TicketListStateImpl>(
          this, _$identity);
}

abstract class _TicketListState implements TicketListState {
  const factory _TicketListState(
      {final int currentQuestionIndex,
      final int totalCount,
      final int limit,
      final int page,
      final List<TicketDto> tickets}) = _$TicketListStateImpl;

  @override
  int get currentQuestionIndex;
  @override
  int get totalCount;
  @override
  int get limit;
  @override
  int get page;
  @override
  List<TicketDto> get tickets;

  /// Create a copy of TicketListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketListStateImplCopyWith<_$TicketListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
