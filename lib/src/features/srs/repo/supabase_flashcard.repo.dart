import 'package:martva/src/features/srs/dto/flashcard.dto.dart';
import 'package:martva/src/features/srs/repo/flashcard.repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFlashcardRepo implements FlashcardRepo {
  const SupabaseFlashcardRepo();

  @override
  Future<List<FlashcardDto>> select() async {
    final response = await Supabase.instance.client
        .from('flashcards')
        .select()
        .order('created_at', ascending: false);

    return response.map((json) => FlashcardDto.fromJson(json)).toList();
  }

  @override
  Future<void> insert(FlashcardDto review) async {
    await Supabase.instance.client.from('flashcards').insert(review.toJson());
  }
}
