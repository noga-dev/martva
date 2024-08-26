// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) => TicketDto(
      id: json['id'] == null ? '' : _parseId(json['id']),
      question: json['question'] as String? ?? '',
      explanation: json['explanation'] as String? ?? '',
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => AnswerDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$TicketDtoToJson(TicketDto instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'explanation': instance.explanation,
      'answers': instance.answers,
      'image': instance.image,
    };

Map<String, dynamic> _$$TicketDtoImplToJson(_$TicketDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'explanation': instance.explanation,
      'answers': instance.answers,
      'image': instance.image,
    };

_$AnswerDtoImpl _$$AnswerDtoImplFromJson(Map<String, dynamic> json) =>
    _$AnswerDtoImpl(
      answer: json['answer'] as String,
      correct: json['correct'] as bool? ?? false,
    );

Map<String, dynamic> _$$AnswerDtoImplToJson(_$AnswerDtoImpl instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'correct': instance.correct,
    };
