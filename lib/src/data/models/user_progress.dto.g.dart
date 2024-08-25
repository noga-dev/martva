// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProgressDtoImpl _$$UserProgressDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProgressDtoImpl(
      userId: json['userId'] as String,
      ticketScores: Map<String, int>.from(json['ticketScores'] as Map),
      completedTickets: (json['completedTickets'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastStudySession: DateTime.parse(json['lastStudySession'] as String),
    );

Map<String, dynamic> _$$UserProgressDtoImplToJson(
        _$UserProgressDtoImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'ticketScores': instance.ticketScores,
      'completedTickets': instance.completedTickets,
      'lastStudySession': instance.lastStudySession.toIso8601String(),
    };
