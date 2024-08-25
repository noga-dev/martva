import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/data/models/ticket.dto.dart';
import 'package:martva/src/domain/repositories/ticket_repository.dart';

final ticketsProvider = FutureProvider<List<TicketDto>>((ref) async {
  final repository = ref.watch(ticketRepositoryProvider);

  return repository.getTickets();
});
