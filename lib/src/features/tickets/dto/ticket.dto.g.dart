// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) => TicketDto(
      id: json['id'] as String? ?? '',
      ordinalId: (json['ordinal_id'] as num?)?.toInt() ?? 0,
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
      'ordinal_id': instance.ordinalId,
      'question': instance.question,
      'explanation': instance.explanation,
      'image': instance.image,
      'answers': instance.answers,
    };

Map<String, dynamic> _$$TicketDtoImplToJson(_$TicketDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ordinal_id': instance.ordinalId,
      'question': instance.question,
      'explanation': instance.explanation,
      'image': instance.image,
      'answers': instance.answers,
    };
