// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_answer.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAnswerDto _$UserAnswerDtoFromJson(Map<String, dynamic> json) =>
    UserAnswerDto(
      id: json['id'] as String,
      flashcardId: json['flashcard_id'] as String,
      answerId: json['answer_id'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$UserAnswerDtoToJson(UserAnswerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'flashcard_id': instance.flashcardId,
      'answer_id': instance.answerId,
      'created_at': instance.createdAt,
    };

_$UserAnswerDtoImpl _$$UserAnswerDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserAnswerDtoImpl(
      id: json['id'] as String? ?? '',
      flashcardId: json['flashcard_id'] as String? ?? '',
      answerId: json['answer_id'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$$UserAnswerDtoImplToJson(_$UserAnswerDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'flashcard_id': instance.flashcardId,
      'answer_id': instance.answerId,
      'created_at': instance.createdAt,
    };
