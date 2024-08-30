import 'package:martva/src/features/tickets/context/ticket.dto.dart';
import 'package:martva/src/features/tickets/data/ticket.repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'spaced_repetition_service.g.dart';

class SpacedRepetitionItem {
  final TicketDto ticket;
  double easinessFactor;
  int interval;
  int repetitions;
  DateTime nextReviewDate;

  SpacedRepetitionItem({
    required this.ticket,
    this.easinessFactor = 2.5,
    this.interval = 0,
    this.repetitions = 0,
    DateTime? nextReviewDate,
  }) : nextReviewDate = nextReviewDate ?? DateTime.now();

  void updateWithGrade(int grade) {
    if (grade >= 3) {
      if (repetitions == 0) {
        interval = 1;
      } else if (repetitions == 1) {
        interval = 6;
      } else {
        interval = (interval * easinessFactor).round();
      }
      repetitions++;
    } else {
      repetitions = 0;
      interval = 1;
    }

    easinessFactor =
        easinessFactor + (0.1 - (5 - grade) * (0.08 + (5 - grade) * 0.02));
    if (easinessFactor < 1.3) easinessFactor = 1.3;

    nextReviewDate = DateTime.now().add(Duration(days: interval));
  }
}

@riverpod
class SpacedRepetitionService extends _$SpacedRepetitionService {
  @override
  Future<List<SpacedRepetitionItem>> build() async {
    final tickets = await ref.watch(ticketRepoProvider.future);

    return tickets
        .map((ticket) => SpacedRepetitionItem(ticket: ticket))
        .toList();
  }

  void updateItemGrade(String ticketId, int grade) async {
    state.value?.map((item) {
      if (item.ticket.id == ticketId) {
        item.updateWithGrade(grade);
      }
      return item;
    }).toList();
  }

  List<SpacedRepetitionItem> getDueItems() {
    final now = DateTime.now();

    if (state.valueOrNull == null) {
      return [];
    }

    return state.requireValue
        .where((item) => item.nextReviewDate.isBefore(now))
        .toList();
  }

  SpacedRepetitionItem getDueItem(TicketDto ticket) {
    return getDueItems().singleWhere(
      (element) => element.ticket.id == ticket.id,
      orElse: () => SpacedRepetitionItem(ticket: ticket),
    );
  }
}
