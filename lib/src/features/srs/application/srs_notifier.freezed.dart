// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'srs_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SrsState {
  List<TicketDto> get dueTickets => throw _privateConstructorUsedError;
  List<SrsItemDto> get nextDueItems => throw _privateConstructorUsedError;
  Map<String, dynamic> get statistics => throw _privateConstructorUsedError;

  /// Create a copy of SrsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SrsStateCopyWith<SrsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SrsStateCopyWith<$Res> {
  factory $SrsStateCopyWith(SrsState value, $Res Function(SrsState) then) =
      _$SrsStateCopyWithImpl<$Res, SrsState>;
  @useResult
  $Res call(
      {List<TicketDto> dueTickets,
      List<SrsItemDto> nextDueItems,
      Map<String, dynamic> statistics});
}

/// @nodoc
class _$SrsStateCopyWithImpl<$Res, $Val extends SrsState>
    implements $SrsStateCopyWith<$Res> {
  _$SrsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SrsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dueTickets = null,
    Object? nextDueItems = null,
    Object? statistics = null,
  }) {
    return _then(_value.copyWith(
      dueTickets: null == dueTickets
          ? _value.dueTickets
          : dueTickets // ignore: cast_nullable_to_non_nullable
              as List<TicketDto>,
      nextDueItems: null == nextDueItems
          ? _value.nextDueItems
          : nextDueItems // ignore: cast_nullable_to_non_nullable
              as List<SrsItemDto>,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SrsStateImplCopyWith<$Res>
    implements $SrsStateCopyWith<$Res> {
  factory _$$SrsStateImplCopyWith(
          _$SrsStateImpl value, $Res Function(_$SrsStateImpl) then) =
      __$$SrsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TicketDto> dueTickets,
      List<SrsItemDto> nextDueItems,
      Map<String, dynamic> statistics});
}

/// @nodoc
class __$$SrsStateImplCopyWithImpl<$Res>
    extends _$SrsStateCopyWithImpl<$Res, _$SrsStateImpl>
    implements _$$SrsStateImplCopyWith<$Res> {
  __$$SrsStateImplCopyWithImpl(
      _$SrsStateImpl _value, $Res Function(_$SrsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SrsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dueTickets = null,
    Object? nextDueItems = null,
    Object? statistics = null,
  }) {
    return _then(_$SrsStateImpl(
      dueTickets: null == dueTickets
          ? _value._dueTickets
          : dueTickets // ignore: cast_nullable_to_non_nullable
              as List<TicketDto>,
      nextDueItems: null == nextDueItems
          ? _value._nextDueItems
          : nextDueItems // ignore: cast_nullable_to_non_nullable
              as List<SrsItemDto>,
      statistics: null == statistics
          ? _value._statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$SrsStateImpl implements _SrsState {
  const _$SrsStateImpl(
      {required final List<TicketDto> dueTickets,
      required final List<SrsItemDto> nextDueItems,
      required final Map<String, dynamic> statistics})
      : _dueTickets = dueTickets,
        _nextDueItems = nextDueItems,
        _statistics = statistics;

  final List<TicketDto> _dueTickets;
  @override
  List<TicketDto> get dueTickets {
    if (_dueTickets is EqualUnmodifiableListView) return _dueTickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dueTickets);
  }

  final List<SrsItemDto> _nextDueItems;
  @override
  List<SrsItemDto> get nextDueItems {
    if (_nextDueItems is EqualUnmodifiableListView) return _nextDueItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nextDueItems);
  }

  final Map<String, dynamic> _statistics;
  @override
  Map<String, dynamic> get statistics {
    if (_statistics is EqualUnmodifiableMapView) return _statistics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statistics);
  }

  @override
  String toString() {
    return 'SrsState(dueTickets: $dueTickets, nextDueItems: $nextDueItems, statistics: $statistics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SrsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._dueTickets, _dueTickets) &&
            const DeepCollectionEquality()
                .equals(other._nextDueItems, _nextDueItems) &&
            const DeepCollectionEquality()
                .equals(other._statistics, _statistics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dueTickets),
      const DeepCollectionEquality().hash(_nextDueItems),
      const DeepCollectionEquality().hash(_statistics));

  /// Create a copy of SrsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SrsStateImplCopyWith<_$SrsStateImpl> get copyWith =>
      __$$SrsStateImplCopyWithImpl<_$SrsStateImpl>(this, _$identity);
}

abstract class _SrsState implements SrsState {
  const factory _SrsState(
      {required final List<TicketDto> dueTickets,
      required final List<SrsItemDto> nextDueItems,
      required final Map<String, dynamic> statistics}) = _$SrsStateImpl;

  @override
  List<TicketDto> get dueTickets;
  @override
  List<SrsItemDto> get nextDueItems;
  @override
  Map<String, dynamic> get statistics;

  /// Create a copy of SrsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SrsStateImplCopyWith<_$SrsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
