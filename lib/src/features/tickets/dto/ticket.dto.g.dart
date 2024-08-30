// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) => TicketDto(
      id: json['id'] == null ? '' : _parseId(json['id']),
      question: json['question'] as String? ?? '',
      explanation: json['explanation'] as String? ?? '',
      image: json['image'] as String? ?? '',
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => AnswerDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TicketDtoToJson(TicketDto instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'explanation': instance.explanation,
      'image': instance.image,
      'answers': instance.answers,
    };

Map<String, dynamic> _$$TicketDtoImplToJson(_$TicketDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'explanation': instance.explanation,
      'image': instance.image,
      'answers': instance.answers,
    };
