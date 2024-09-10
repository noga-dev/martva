// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'srs_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SrsItemDtoImpl _$$SrsItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$SrsItemDtoImpl(
      id: json['id'] as String,
      ticketId: json['ticketId'] as String,
      nextDueDate: DateTime.parse(json['nextDueDate'] as String),
      interval: (json['interval'] as num).toInt(),
      easeFactor: (json['easeFactor'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SrsItemDtoImplToJson(_$SrsItemDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticketId': instance.ticketId,
      'nextDueDate': instance.nextDueDate.toIso8601String(),
      'interval': instance.interval,
      'easeFactor': instance.easeFactor,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$SrsLogDtoImpl _$$SrsLogDtoImplFromJson(Map<String, dynamic> json) =>
    _$SrsLogDtoImpl(
      id: json['id'] as String,
      srsItemId: json['srsItemId'] as String,
      ticketId: json['ticketId'] as String,
      answerId: json['answerId'] as String,
      isCorrect: json['isCorrect'] as bool,
      easeFactor: (json['easeFactor'] as num).toDouble(),
      interval: (json['interval'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$SrsLogDtoImplToJson(_$SrsLogDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'srsItemId': instance.srsItemId,
      'ticketId': instance.ticketId,
      'answerId': instance.answerId,
      'isCorrect': instance.isCorrect,
      'easeFactor': instance.easeFactor,
      'interval': instance.interval,
      'createdAt': instance.createdAt.toIso8601String(),
    };
