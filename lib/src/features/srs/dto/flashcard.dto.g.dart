// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlashcardDto _$FlashcardDtoFromJson(Map<String, dynamic> json) => FlashcardDto(
      id: json['id'] as String? ?? '',
      ticketId: json['ticket_id'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      answerIndex: (json['answer_index'] as num?)?.toInt() ?? -1,
      easeFactor: (json['ease_factor'] as num?)?.toDouble() ?? 0.0,
      interval: (json['interval'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$FlashcardDtoToJson(FlashcardDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_id': instance.ticketId,
      'created_at': instance.createdAt,
      'answer_index': instance.answerIndex,
      'ease_factor': instance.easeFactor,
      'interval': instance.interval,
    };

Map<String, dynamic> _$$FlashcardDtoImplToJson(_$FlashcardDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_id': instance.ticketId,
      'created_at': instance.createdAt,
      'answer_index': instance.answerIndex,
      'ease_factor': instance.easeFactor,
      'interval': instance.interval,
    };
