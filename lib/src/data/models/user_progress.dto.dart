// File: lib/data/models/user_progress.dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_progress.dto.freezed.dart';
part 'user_progress.dto.g.dart';

@freezed
class UserProgressDto with _$UserProgressDto {
  const factory UserProgressDto({
    required String userId,
    required Map<String, int> ticketScores,
    required List<String> completedTickets,
    required DateTime lastStudySession,
  }) = _UserProgressDto;

  factory UserProgressDto.fromJson(Map<String, dynamic> json) =>
      _$UserProgressDtoFromJson(json);
}
