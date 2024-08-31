import 'package:martva/src/features/srs/dto/flashcard.dto.dart';
import 'package:martva/src/features/srs/service/flashcard.service.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flashcards.controller.g.dart';

@riverpod
class FlashcardsController extends _$FlashcardsController {
  @override
  Future<List<FlashcardDto>> build() async {
    state = const AsyncValue.loading();

    final flashcardService = ref.read(flashcardServiceProvider);

    final reviews =
        await AsyncValue.guard(() => flashcardService.getDueReviews());

    state = reviews;

    return state.requireValue;
  }

  Future<void> reviewFlashcard({
    required TicketDto ticket,
    required int answerIndex,
    required FlashcardDto flashcard,
  }) async {
    state = const AsyncValue.loading();
    try {
      await ref.read(flashcardServiceProvider).reviewFlashcard(
            ticket: ticket,
            answerIndex: answerIndex,
            flashcard: flashcard,
          );
      // state = const AsyncValue.data();
    } catch (e) {
      rethrow;
      // state = AsyncValue.error(e);
    }
  }
}
