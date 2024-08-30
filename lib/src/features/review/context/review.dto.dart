import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/features/tickets/context/ticket.dto.dart';

part 'review.dto.freezed.dart';
part 'review.dto.g.dart';

@JsonSerializable()
@Freezed(fromJson: false)
class ReviewDto with _$ReviewDto {
  const factory ReviewDto({
    @Default('') @JsonKey(defaultValue: '') String id,
    @Default(TicketDto()) @JsonKey() TicketDto ticket,
  }) = _ReviewDto;

  factory ReviewDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewDtoFromJson(json);
}
