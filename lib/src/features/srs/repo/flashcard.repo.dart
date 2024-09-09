import 'package:martva/src/core/utils/aliases/string.dart';
import 'package:martva/src/features/srs/dto/flashcard.dto.dart';
import 'package:martva/src/features/srs/dto/user_answer.dto.dart';
import 'package:martva/src/features/srs/repo/supabase_flashcard.repo.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'flashcard.repo.g.dart';

abstract class FlashcardRepo {
  Future<List<TicketDto>> getTickets();
  Future<List<FlashcardDto>> getDueFlashcards();
  Future<FlashcardDto> createFlashcard(UUID ticketId);
  Future<void> updateFlashcard(FlashcardDto flashcard);
  Future<void> logUserAnswer(UserAnswerDto userAnswer);
}

@riverpod
FlashcardRepo flashcardRepo(FlashcardRepoRef ref) {
  return SupabaseFlashcardRepo(Supabase.instance.client);
}
