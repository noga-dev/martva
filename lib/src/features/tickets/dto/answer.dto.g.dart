// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerDto _$AnswerDtoFromJson(Map<String, dynamic> json) => AnswerDto(
      answer: json['answer'] as String? ?? '',
      ordinal: (json['ordinal'] as num?)?.toInt() ?? -1,
      correct: json['correct'] as bool? ?? false,
    );

Map<String, dynamic> _$AnswerDtoToJson(AnswerDto instance) => <String, dynamic>{
      'answer': instance.answer,
      'ordinal': instance.ordinal,
      'correct': instance.correct,
    };

Map<String, dynamic> _$$AnswerDtoImplToJson(_$AnswerDtoImpl instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'ordinal': instance.ordinal,
      'correct': instance.correct,
    };
