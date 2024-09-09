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
      easeFactor: (json['ease_factor'] as num?)?.toDouble() ?? 2.5,
      interval: (json['interval'] as num?)?.toInt() ?? 1,
      repetitions: (json['repetitions'] as num?)?.toInt() ?? 0,
      lastReviewedAt: json['last_reviewed_at'] as String,
      nextReviewAt: json['next_review_at'] as String,
    );

Map<String, dynamic> _$FlashcardDtoToJson(FlashcardDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_id': instance.ticketId,
      'created_at': instance.createdAt,
      'due_date': instance.dueDate,
      'stability': instance.stability,
      'difficulty': instance.difficulty,
      'ease_factor': instance.easeFactor,
      'interval': instance.interval,
      'repetitions': instance.repetitions,
      'last_reviewed_at': instance.lastReviewedAt,
      'next_review_at': instance.nextReviewAt,
    };

Map<String, dynamic> _$$FlashcardDtoImplToJson(_$FlashcardDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_id': instance.ticketId,
      'created_at': instance.createdAt,
      'due_date': instance.dueDate,
      'stability': instance.stability,
      'difficulty': instance.difficulty,
      'ease_factor': instance.easeFactor,
      'interval': instance.interval,
      'repetitions': instance.repetitions,
      'last_reviewed_at': instance.lastReviewedAt,
      'next_review_at': instance.nextReviewAt,
    };
