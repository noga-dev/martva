import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/ticket_card_organism.dart';

part 'ticket_details.state.freezed.dart';

@freezed
class TicketDetailsState with _$TicketDetailsState {
  const factory TicketDetailsState({
    @Default(QuestionState(ticket: TicketDto())) QuestionState solution,
    @Default('') String nextTicketId,
    @Default('') String prevTicketId,
  }) = _TicketDetailsState;

  static TicketDetailsState skeleton() => TicketDetailsState(
        solution: QuestionState.skeleton(),
      );
}
