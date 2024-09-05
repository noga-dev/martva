import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/i18n/data/localization.repo.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket.service.g.dart';

class TicketService {
  const TicketService(this._ref);

  final Ref _ref;

  Future<List<TicketDto>> getTickets() async {
    final repo = _ref.read(ticketRepoProvider);
    final localizationRepo = _ref.read(localizationRepoProvider);

    final results = repo.getTickets(
      limit: 30,
      language: localizationRepo,
      translation: TicketTranslation.gpt4oMini,
      sortByOrdinalId: true,
    );

    return results;
  }
}

@riverpod
TicketService ticketService(TicketServiceRef ref) {
  return TicketService(ref);
}
