import 'package:martva/src/core/utils/aliases/string.dart';
import 'package:martva/src/features/srs/service/flashcard.service.dart';
import 'package:martva/src/features/srs/view/screens/flashcards.state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flashcards.controller.g.dart';

@riverpod
class FlashcardsController extends _$FlashcardsController {
  @override
  Future<FlashcardsState> build() async {
    await loadFlashcards();
    return state.valueOrNull ?? const FlashcardsState();
  }

  Future<void> loadFlashcards() async {
    state = const AsyncLoading();
    try {
      final useCase = ref.read(flashcardUseCaseProvider);
      final tickets = await useCase.getTickets();
      final dueFlashcards = await useCase.getDueFlashcards();
      state = AsyncData(state.value!.copyWith(
        tickets: tickets,
        dueFlashcards: dueFlashcards,
      ));
      if (dueFlashcards.isNotEmpty) {
        await _loadNextFlashcard();
      }
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }

  Future<void> answerCurrentFlashcard(UUID answerId) async {
    if (state.value!.currentFlashcard == null ||
        state.value!.currentTicket == null) {
      return;
    }

    final useCase = ref.read(flashcardUseCaseProvider);
    await useCase.answerFlashcard(state.value!.currentFlashcard!, answerId);

    await _loadNextFlashcard();
  }

  Future<void> _loadNextFlashcard() async {
    if (state.value!.dueFlashcards.isEmpty) {
      state = AsyncData(state.value!.copyWith(
        currentFlashcard: null,
        currentTicket: null,
      ));
      return;
    }

    final useCase = ref.read(flashcardUseCaseProvider);
    final nextFlashcard = state.value!.dueFlashcards.first;
    final updatedFlashcard =
        await useCase.getOrCreateFlashcard(nextFlashcard.ticketId);
    final currentTicket = state.value!.tickets
        .firstWhere((t) => t.id == updatedFlashcard.ticketId);

    state = AsyncData(state.value!.copyWith(
      currentFlashcard: updatedFlashcard,
      currentTicket: currentTicket,
      dueFlashcards: state.value!.dueFlashcards.skip(1).toList(),
    ));
  }
}
