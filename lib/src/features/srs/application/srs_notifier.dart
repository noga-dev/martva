// srs_notifier.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/features/srs/data/srs_repository.dart';
import 'package:martva/src/features/srs/domain/srs_item_dto.dart';
import 'package:martva/src/features/srs/domain/srs_service.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'srs_notifier.freezed.dart';
part 'srs_notifier.g.dart';

@riverpod
class SrsNotifier extends _$SrsNotifier {
  late final SrsRepository _repository;
  late final SrsService _service;

  @override
  Future<SrsState> build() async {
    _repository = ref.watch(srsRepositoryProvider.notifier);
    _service = ref.watch(srsServiceProvider.notifier);

    // Populate SRS items if needed
    await _repository.populateSrsItemsForExistingTickets();

    return _loadSrsState();
  }

  Future<SrsState> _loadSrsState() async {
    final dueItems = await _repository.getDueItems();
    final nextDueItems = await _repository.getNextDueItems(limit: 5);
    final statistics = await _repository.getSrsStatistics();
    final dueTickets = (await Future.wait(
      dueItems.map((item) => _repository.getTicket(item.ticketId)),
    ))
        .whereType<TicketDto>()
        .toList();

    return SrsState(
      dueTickets: dueTickets,
      nextDueItems: nextDueItems,
      statistics: statistics,
    );
  }

  Future<void> answerQuestion(String ticketId, String answerId) async {
    final srsItem = await _repository.getOrCreateSrsItem(ticketId);
    if (srsItem == null) {
      print('Failed to get or create SRS item for ticket $ticketId');

      return;
    }

    final ticket = await _repository.getTicket(ticketId);
    if (ticket == null) {
      print('Failed to get ticket $ticketId');

      return;
    }

    final answer = ticket.answers.firstWhere((a) => a.id == answerId);

    await _service.processAnswer(srsItem, answerId, answer.correct);
    state = AsyncValue.data(await _loadSrsState());
  }
}

@freezed
class SrsState with _$SrsState {
  const factory SrsState({
    required List<TicketDto> dueTickets,
    required List<SrsItemDto> nextDueItems,
    required Map<String, dynamic> statistics,
  }) = _SrsState;
}
