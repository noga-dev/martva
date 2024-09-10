// srs_notifier.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/core/utils/messaging/logger.dart';
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
    return _loadSrsState();
  }

  Future<SrsState> _loadSrsState() async {
    final allTickets = await _repository.getAllTickets();
    final srsItems = await _repository.getSrsItems();
    final statistics = await _repository.getSrsStatistics();

    final dueTickets = allTickets.where((ticket) {
      final srsItem = srsItems.firstWhere(
        (item) => item.ticketId == ticket.id,
        orElse: () => SrsItemDto(
          id: '',
          ticketId: ticket.id,
          nextDueDate: DateTime.now().subtract(const Duration(days: 1)),
          interval: 0,
          easeFactor: 2.5,
          createdAt: DateTime.now().toUtc(),
          updatedAt: DateTime.now().toUtc(),
        ),
      );
      return srsItem.nextDueDate.isBefore(DateTime.now());
    }).toList();

    final nextDueItems = srsItems
      ..sort((a, b) => a.nextDueDate.compareTo(b.nextDueDate));

    return SrsState(
      allTickets: allTickets,
      dueTickets: dueTickets,
      nextDueItems: nextDueItems.take(5).toList(),
      statistics: statistics,
    );
  }

  Future<void> answerQuestion(String ticketId, String answerId) async {
    final srsItem = await _repository.getOrCreateSrsItem(ticketId);
    final ticket = await _repository.getTicket(ticketId);
    final answer = ticket?.answers.firstWhere((a) => a.id == answerId);

    if (answer == null || srsItem == null) {
      logger.d('$answer $srsItem');
      throw Exception();
    }

    await _service.processAnswer(srsItem, answerId, answer.correct);
    state = AsyncValue.data(await _loadSrsState());
  }
}

@freezed
class SrsState with _$SrsState {
  const factory SrsState({
    required List<TicketDto> allTickets,
    required List<TicketDto> dueTickets,
    required List<SrsItemDto> nextDueItems,
    required Map<String, dynamic> statistics,
  }) = _SrsState;
}
