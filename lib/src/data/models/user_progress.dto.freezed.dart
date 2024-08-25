// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_progress.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProgressDto _$UserProgressDtoFromJson(Map<String, dynamic> json) {
  return _UserProgressDto.fromJson(json);
}

/// @nodoc
mixin _$UserProgressDto {
  String get userId => throw _privateConstructorUsedError;
  Map<String, int> get ticketScores => throw _privateConstructorUsedError;
  List<String> get completedTickets => throw _privateConstructorUsedError;
  DateTime get lastStudySession => throw _privateConstructorUsedError;

  /// Serializes this UserProgressDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProgressDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProgressDtoCopyWith<UserProgressDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProgressDtoCopyWith<$Res> {
  factory $UserProgressDtoCopyWith(
          UserProgressDto value, $Res Function(UserProgressDto) then) =
      _$UserProgressDtoCopyWithImpl<$Res, UserProgressDto>;
  @useResult
  $Res call(
      {String userId,
      Map<String, int> ticketScores,
      List<String> completedTickets,
      DateTime lastStudySession});
}

/// @nodoc
class _$UserProgressDtoCopyWithImpl<$Res, $Val extends UserProgressDto>
    implements $UserProgressDtoCopyWith<$Res> {
  _$UserProgressDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProgressDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? ticketScores = null,
    Object? completedTickets = null,
    Object? lastStudySession = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketScores: null == ticketScores
          ? _value.ticketScores
          : ticketScores // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      completedTickets: null == completedTickets
          ? _value.completedTickets
          : completedTickets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastStudySession: null == lastStudySession
          ? _value.lastStudySession
          : lastStudySession // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProgressDtoImplCopyWith<$Res>
    implements $UserProgressDtoCopyWith<$Res> {
  factory _$$UserProgressDtoImplCopyWith(_$UserProgressDtoImpl value,
          $Res Function(_$UserProgressDtoImpl) then) =
      __$$UserProgressDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      Map<String, int> ticketScores,
      List<String> completedTickets,
      DateTime lastStudySession});
}

/// @nodoc
class __$$UserProgressDtoImplCopyWithImpl<$Res>
    extends _$UserProgressDtoCopyWithImpl<$Res, _$UserProgressDtoImpl>
    implements _$$UserProgressDtoImplCopyWith<$Res> {
  __$$UserProgressDtoImplCopyWithImpl(
      _$UserProgressDtoImpl _value, $Res Function(_$UserProgressDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProgressDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? ticketScores = null,
    Object? completedTickets = null,
    Object? lastStudySession = null,
  }) {
    return _then(_$UserProgressDtoImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketScores: null == ticketScores
          ? _value._ticketScores
          : ticketScores // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      completedTickets: null == completedTickets
          ? _value._completedTickets
          : completedTickets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastStudySession: null == lastStudySession
          ? _value.lastStudySession
          : lastStudySession // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProgressDtoImpl implements _UserProgressDto {
  const _$UserProgressDtoImpl(
      {required this.userId,
      required final Map<String, int> ticketScores,
      required final List<String> completedTickets,
      required this.lastStudySession})
      : _ticketScores = ticketScores,
        _completedTickets = completedTickets;

  factory _$UserProgressDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProgressDtoImplFromJson(json);

  @override
  final String userId;
  final Map<String, int> _ticketScores;
  @override
  Map<String, int> get ticketScores {
    if (_ticketScores is EqualUnmodifiableMapView) return _ticketScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_ticketScores);
  }

  final List<String> _completedTickets;
  @override
  List<String> get completedTickets {
    if (_completedTickets is EqualUnmodifiableListView)
      return _completedTickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedTickets);
  }

  @override
  final DateTime lastStudySession;

  @override
  String toString() {
    return 'UserProgressDto(userId: $userId, ticketScores: $ticketScores, completedTickets: $completedTickets, lastStudySession: $lastStudySession)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProgressDtoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._ticketScores, _ticketScores) &&
            const DeepCollectionEquality()
                .equals(other._completedTickets, _completedTickets) &&
            (identical(other.lastStudySession, lastStudySession) ||
                other.lastStudySession == lastStudySession));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      const DeepCollectionEquality().hash(_ticketScores),
      const DeepCollectionEquality().hash(_completedTickets),
      lastStudySession);

  /// Create a copy of UserProgressDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProgressDtoImplCopyWith<_$UserProgressDtoImpl> get copyWith =>
      __$$UserProgressDtoImplCopyWithImpl<_$UserProgressDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProgressDtoImplToJson(
      this,
    );
  }
}

abstract class _UserProgressDto implements UserProgressDto {
  const factory _UserProgressDto(
      {required final String userId,
      required final Map<String, int> ticketScores,
      required final List<String> completedTickets,
      required final DateTime lastStudySession}) = _$UserProgressDtoImpl;

  factory _UserProgressDto.fromJson(Map<String, dynamic> json) =
      _$UserProgressDtoImpl.fromJson;

  @override
  String get userId;
  @override
  Map<String, int> get ticketScores;
  @override
  List<String> get completedTickets;
  @override
  DateTime get lastStudySession;

  /// Create a copy of UserProgressDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProgressDtoImplCopyWith<_$UserProgressDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
