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
      repetitions: (json['repetitions'] as num?)?.toInt() ?? 0,
      easeFactor: (json['ease_factor'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$ReviewDtoToJson(ReviewDto instance) => <String, dynamic>{
      'id': instance.id,
      'ticket_id': instance.ticketId,
      'next_review_at': instance.nextReviewAt,
      'interval': instance.interval,
      'repetitions': instance.repetitions,
      'ease_factor': instance.easeFactor,
    };

Map<String, dynamic> _$$ReviewDtoImplToJson(_$ReviewDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_id': instance.ticketId,
      'next_review_at': instance.nextReviewAt,
      'interval': instance.interval,
      'repetitions': instance.repetitions,
      'ease_factor': instance.easeFactor,
    };
