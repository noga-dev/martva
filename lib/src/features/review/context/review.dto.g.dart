// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewDto _$ReviewDtoFromJson(Map<String, dynamic> json) => ReviewDto(
      id: json['id'] as String? ?? '',
      ticketId: json['ticket_id'] as String? ?? '',
      nextReviewAt: json['next_review_at'] as String? ?? '',
      interval: (json['interval'] as num?)?.toInt() ?? 0,
      stage: (json['stage'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ReviewDtoToJson(ReviewDto instance) => <String, dynamic>{
      'id': instance.id,
      'ticket_id': instance.ticketId,
      'next_review_at': instance.nextReviewAt,
      'interval': instance.interval,
      'stage': instance.stage,
    };

Map<String, dynamic> _$$ReviewDtoImplToJson(_$ReviewDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_id': instance.ticketId,
      'next_review_at': instance.nextReviewAt,
      'interval': instance.interval,
      'stage': instance.stage,
    };
