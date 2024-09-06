import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/core/utils/constants.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';

part 'ticket_list.state.freezed.dart';

@freezed
class TicketListState with _$TicketListState {
  const factory TicketListState({
    @Default(0) int totalCount,
    @Default(Constants.ticketListLimit) int limit,
    @Default(1) int page,
    @Default([]) List<TicketDto> tickets,
    @Default('') String query,
    @Default(false) bool showSearchBar,
  }) = _TicketListState;

  static TicketListState skeleton() => TicketListState(
        tickets: List.generate(
          Constants.ticketListLimit,
          (index) => TicketDto.skeleton(),
        ),
        totalCount: 0,
        page: 1,
        limit: Constants.ticketListLimit,
        query: '',
        showSearchBar: false,
      );
}
