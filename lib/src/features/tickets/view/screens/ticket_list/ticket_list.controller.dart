import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/service/ticket.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_list.controller.g.dart';

@riverpod
class TicketListController extends _$TicketListController {
  @override
  Future<List<TicketDto>> build() async {
    final ticketService = ref.read(ticketServiceProvider);

    return ticketService.getTickets();
  }
}
