import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket.service.g.dart';

class TicketService {
  const TicketService(this._ref);

  final Ref _ref;

  Future<void> setUserAnswer({
    required String ticketId,
    required String answerId,
  }) async {
    final repo = _ref.read(ticketRepoProvider);

    await repo.setUserAnswer(
      ticketId: ticketId,
      answerId: answerId,
    );
  }
}

@riverpod
TicketService ticketService(TicketServiceRef ref) {
  return TicketService(ref);
}
