// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewDto _$ReviewDtoFromJson(Map<String, dynamic> json) => ReviewDto(
      id: json['id'] as String? ?? '',
      ticket: TicketDto.fromJson(json['ticket'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewDtoToJson(ReviewDto instance) => <String, dynamic>{
      'id': instance.id,
      'ticket': instance.ticket,
    };

Map<String, dynamic> _$$ReviewDtoImplToJson(_$ReviewDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket': instance.ticket,
    };
