// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewDto {
  @JsonKey(defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey()
  TicketDto get ticket => throw _privateConstructorUsedError;

  /// Serializes this ReviewDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewDtoCopyWith<ReviewDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewDtoCopyWith<$Res> {
  factory $ReviewDtoCopyWith(ReviewDto value, $Res Function(ReviewDto) then) =
      _$ReviewDtoCopyWithImpl<$Res, ReviewDto>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String id, @JsonKey() TicketDto ticket});

  $TicketDtoCopyWith<$Res> get ticket;
}

/// @nodoc
class _$ReviewDtoCopyWithImpl<$Res, $Val extends ReviewDto>
    implements $ReviewDtoCopyWith<$Res> {
  _$ReviewDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticket = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ticket: null == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as TicketDto,
    ) as $Val);
  }

  /// Create a copy of ReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TicketDtoCopyWith<$Res> get ticket {
    return $TicketDtoCopyWith<$Res>(_value.ticket, (value) {
      return _then(_value.copyWith(ticket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewDtoImplCopyWith<$Res>
    implements $ReviewDtoCopyWith<$Res> {
  factory _$$ReviewDtoImplCopyWith(
          _$ReviewDtoImpl value, $Res Function(_$ReviewDtoImpl) then) =
      __$$ReviewDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String id, @JsonKey() TicketDto ticket});

  @override
  $TicketDtoCopyWith<$Res> get ticket;
}

/// @nodoc
class __$$ReviewDtoImplCopyWithImpl<$Res>
    extends _$ReviewDtoCopyWithImpl<$Res, _$ReviewDtoImpl>
    implements _$$ReviewDtoImplCopyWith<$Res> {
  __$$ReviewDtoImplCopyWithImpl(
      _$ReviewDtoImpl _value, $Res Function(_$ReviewDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticket = null,
  }) {
    return _then(_$ReviewDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ticket: null == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as TicketDto,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ReviewDtoImpl implements _ReviewDto {
  const _$ReviewDtoImpl(
      {@JsonKey(defaultValue: '') this.id = '',
      @JsonKey() this.ticket = const TicketDto()});

  @override
  @JsonKey(defaultValue: '')
  final String id;
  @override
  @JsonKey()
  final TicketDto ticket;

  @override
  String toString() {
    return 'ReviewDto(id: $id, ticket: $ticket)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ticket, ticket) || other.ticket == ticket));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, ticket);

  /// Create a copy of ReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewDtoImplCopyWith<_$ReviewDtoImpl> get copyWith =>
      __$$ReviewDtoImplCopyWithImpl<_$ReviewDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewDtoImplToJson(
      this,
    );
  }
}

abstract class _ReviewDto implements ReviewDto {
  const factory _ReviewDto(
      {@JsonKey(defaultValue: '') final String id,
      @JsonKey() final TicketDto ticket}) = _$ReviewDtoImpl;

  @override
  @JsonKey(defaultValue: '')
  String get id;
  @override
  @JsonKey()
  TicketDto get ticket;

  /// Create a copy of ReviewDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewDtoImplCopyWith<_$ReviewDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
