// srs_item_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'srs_item_dto.freezed.dart';
part 'srs_item_dto.g.dart';

@freezed
class SrsItemDto with _$SrsItemDto {
  const factory SrsItemDto({
    required String id,
    required String ticketId,
    required DateTime nextDueDate,
    required int interval,
    required double easeFactor,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SrsItemDto;

  factory SrsItemDto.fromJson(Map<String, dynamic> json) =>
      _$SrsItemDtoFromJson(json);
}

@freezed
class SrsLogDto with _$SrsLogDto {
  const factory SrsLogDto({
    required String id,
    required String srsItemId,
    required String ticketId,
    required String answerId,
    required bool isCorrect,
    required double easeFactor,
    required int interval,
    required DateTime createdAt,
  }) = _SrsLogDto;

  factory SrsLogDto.fromJson(Map<String, dynamic> json) =>
      _$SrsLogDtoFromJson(json);
}
