// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerDto _$AnswerDtoFromJson(Map<String, dynamic> json) => AnswerDto(
      id: json['id'] as String? ?? '',
      answer: json['answer'] as String? ?? '',
      ordinal: (json['ordinal'] as num?)?.toInt() ?? -1,
      correct: json['correct'] as bool? ?? false,
    );

Map<String, dynamic> _$AnswerDtoToJson(AnswerDto instance) => <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'ordinal': instance.ordinal,
      'correct': instance.correct,
    };

Map<String, dynamic> _$$AnswerDtoImplToJson(_$AnswerDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'ordinal': instance.ordinal,
      'correct': instance.correct,
    };
