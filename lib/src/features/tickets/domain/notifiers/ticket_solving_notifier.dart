// File: lib/features/tickets/domain/notifiers/ticket_solving_notifier.dart
import 'package:martva/src/data/models/ticket.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/services/spaced_repetition_service.dart';
import '../../../auth/presentation/notifiers/auth_notifier.dart';

part 'ticket_solving_notifier.g.dart';

@riverpod
class TicketSolvingNotifier extends _$TicketSolvingNotifier {
  @override
  FutureOr<List<TicketDto>> build() {
    return _loadTickets();
  }

  Future<List<TicketDto>> _loadTickets() async {
    final user = ref.read(authNotifierProvider);
    if (user == null) {
      throw Exception('User not authenticated');
    }

    final spacedRepetitionService = ref.read(spacedRepetitionServiceProvider);
    return spacedRepetitionService.getNextTickets(user.id, 10);
  }

  Future<void> answerTicket(TicketDto ticket, bool correct) async {
    final user = ref.read(authNotifierProvider);
    if (user == null) {
      throw Exception('User not authenticated');
    }

    final spacedRepetitionService = ref.read(spacedRepetitionServiceProvider);
    await spacedRepetitionService.updateTicketScore(
        user.id, ticket.id.toString(), correct);

    // Reload tickets after answering
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadTickets());
  }
}
