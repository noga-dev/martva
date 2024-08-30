import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/features/tickets/context/ticket.dto.dart';

part 'review.dto.freezed.dart';
part 'review.dto.g.dart';

typedef ReviewId = String;
typedef DateTimeISO8601 = String;

@JsonSerializable()
@Freezed(fromJson: false)
class ReviewDto with _$ReviewDto {
  const factory ReviewDto({
    @Default('')
    @JsonKey(
      defaultValue: '',
      name: 'id',
    )
    ReviewId id,
    //
    @Default('')
    @JsonKey(
      defaultValue: '',
      name: 'ticket_id',
    )
    TicketId ticketId,
    //
    @Default('')
    @JsonKey(
      defaultValue: '',
      name: 'next_review_at',
    )
    DateTimeISO8601 nextReviewAt,
    //
    @Default(0)
    @JsonKey(
      defaultValue: 0,
      name: 'interval',
    )
    int interval,
    //
    @Default(0)
    @JsonKey(
      defaultValue: 0,
      name: 'stage',
    )
    int stage,
  }) = _ReviewDto;

  factory ReviewDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewDtoFromJson(json);
}
