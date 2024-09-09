import 'package:martva/src/core/utils/aliases/string.dart';
import 'package:martva/src/features/srs/dto/flashcard.dto.dart';
import 'package:martva/src/features/srs/dto/user_answer.dto.dart';
import 'package:martva/src/features/srs/repo/flashcard.repo.dart';
import 'package:martva/src/features/srs/service/flashcard.service.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFlashcardRepo implements FlashcardRepo {
  final SupabaseClient _client;

  SupabaseFlashcardRepo(this._client);

  @override
  Future<List<TicketDto>> getTickets() async {
    final response = await _client.from('tickets').select();
    return response.map((json) => TicketDto.fromJson(json)).toList();
  }

  @override
  Future<List<FlashcardDto>> getDueFlashcards() async {
    final response = await _client
        .from('flashcards')
        .select()
        .lte('due_date', DateTime.now().toIso8601String());

    return response.map((json) => FlashcardDto.fromJson(json)).toList();
  }

  @override
  Future<FlashcardDto> createFlashcard(UUID ticketId) async {
    final newFlashcard = FlashcardDto(
      ticketId: ticketId,
      createdAt: DateTime.now().toIso8601String(),
      dueDate: DateTime.now().toIso8601String(),
      stability: FSRS.defaultStability,
      difficulty: FSRS.defaultDifficulty,
    );
    final response =
        await _client.from('flashcards').insert(newFlashcard.toJson());
    return FlashcardDto.fromJson(response.data[0]);
  }

  @override
  Future<void> updateFlashcard(FlashcardDto flashcard) async {
    await _client
        .from('flashcards')
        .update(flashcard.toJson())
        .eq('id', flashcard.id);
  }

  @override
  Future<void> logUserAnswer(UserAnswerDto userAnswer) async {
    await _client.from('user_answers').insert(userAnswer.toJson());
  }
}
