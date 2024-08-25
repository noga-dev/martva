// File: lib/domain/services/spaced_repetition_service.dart
import 'package:martva/src/data/models/ticket.dto.dart';
import 'package:martva/src/domain/repositories/ticket_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/user_progress.dto.dart';
import '../../data/repositories/user_repository.dart';

part 'spaced_repetition_service.g.dart';

class SpacedRepetitionService {
  final TicketRepository _ticketRepository;
  final UserRepository _userRepository;

  SpacedRepetitionService(this._ticketRepository, this._userRepository);

  Future<List<TicketDto>> getNextTickets(String userId, int count) async {
    final allTickets = _ticketRepository.getTickets();
    final userProgress = await _userRepository.getUserProgress(userId);

    if (userProgress == null) {
      // If no progress, return the first 'count' tickets
      return allTickets.take(count).toList();
    }

    // Sort tickets based on spaced repetition algorithm
    allTickets.sort((a, b) {
      final scoreA = userProgress.ticketScores[a.id.toString()] ?? 0;
      final scoreB = userProgress.ticketScores[b.id.toString()] ?? 0;
      return scoreA.compareTo(scoreB);
    });

    return allTickets.take(count).toList();
  }

  Future<void> updateTicketScore(
      String userId, String ticketId, bool correct) async {
    final userProgress = await _userRepository.getUserProgress(userId);
    final updatedScores =
        Map<String, int>.from(userProgress?.ticketScores ?? {});
    final currentScore = updatedScores[ticketId] ?? 0;

    if (correct) {
      updatedScores[ticketId] = currentScore + 1;
    } else {
      updatedScores[ticketId] = 0; // Reset score on incorrect answer
    }

    final updatedProgress = UserProgressDto(
      userId: userId,
      ticketScores: updatedScores,
      completedTickets: userProgress?.completedTickets ?? [],
      lastStudySession: DateTime.now(),
    );

    await _userRepository.saveUserProgress(updatedProgress);
  }
}

@riverpod
SpacedRepetitionService spacedRepetitionService(
    SpacedRepetitionServiceRef ref) {
  final ticketRepository = ref.watch(ticketRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);

  return SpacedRepetitionService(ticketRepository, userRepository);
}
