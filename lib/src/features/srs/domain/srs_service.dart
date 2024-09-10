// srs_service.dart
import 'dart:math';

import 'package:martva/src/features/srs/data/srs_repository.dart';
import 'package:martva/src/features/srs/domain/srs_item_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'srs_service.g.dart';

@riverpod
class SrsService extends _$SrsService {
  late final SrsRepository _repository;

  @override
  Future<void> build() async {
    _repository = ref.watch(srsRepositoryProvider.notifier);
  }

  Future<void> processAnswer(
      SrsItemDto item, String answerId, bool isCorrect) async {
    final newInterval = _calculateNewInterval(item.interval, isCorrect);
    final newEaseFactor = _calculateNewEaseFactor(item.easeFactor, isCorrect);
    final newNextDueDate = DateTime.now().add(Duration(days: newInterval));

    final updatedItem = item.copyWith(
      interval: newInterval,
      easeFactor: newEaseFactor,
      nextDueDate: newNextDueDate,
      updatedAt: DateTime.now().toUtc(),
    );

    await _repository.updateSrsItem(updatedItem);

    final log = SrsLogDto(
      id: '',
      srsItemId: item.id,
      ticketId: item.ticketId,
      answerId: answerId,
      isCorrect: isCorrect,
      easeFactor: newEaseFactor,
      interval: newInterval,
      createdAt: DateTime.now().toUtc(),
    );

    await _repository.logSrsAttempt(log);
  }

  int _calculateNewInterval(int currentInterval, bool isCorrect) {
    if (!isCorrect) return 1;
    if (currentInterval == 0) return 1;
    if (currentInterval == 1) return 6;
    return (currentInterval * 1.5).round();
  }

  double _calculateNewEaseFactor(double currentEaseFactor, bool isCorrect) {
    if (isCorrect) {
      return currentEaseFactor + 0.1;
    } else {
      return max(1.3, currentEaseFactor - 0.2);
    }
  }
}
