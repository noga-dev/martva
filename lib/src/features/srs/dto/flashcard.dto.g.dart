// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlashcardDto _$FlashcardDtoFromJson(Map<String, dynamic> json) => FlashcardDto(
      id: json['id'] as String? ?? '',
      ticketId: json['ticket_id'] as String? ?? '',
      createdAt: json['created_at'] as String,
      dueDate: json['due_date'] as String,
      stability: (json['stability'] as num?)?.toDouble() ?? 0.0,
      difficulty: (json['difficulty'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$FlashcardDtoToJson(FlashcardDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_id': instance.ticketId,
      'created_at': instance.createdAt,
      'due_date': instance.dueDate,
      'stability': instance.stability,
      'difficulty': instance.difficulty,
    };

Map<String, dynamic> _$$FlashcardDtoImplToJson(_$FlashcardDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_id': instance.ticketId,
      'created_at': instance.createdAt,
      'due_date': instance.dueDate,
      'stability': instance.stability,
      'difficulty': instance.difficulty,
    };
