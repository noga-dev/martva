import 'package:martva/src/features/srs/dto/flashcard.dto.dart';
import 'package:martva/src/features/srs/repo/supabase_flashcard.repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flashcard.repo.g.dart';

abstract class FlashcardRepo {
  Future<List<FlashcardDto>> select();
  Future<void> insert(FlashcardDto review);
}

@Riverpod(keepAlive: true)
FlashcardRepo flashcardRepo(FlashcardRepoRef ref) {
  return const SupabaseFlashcardRepo();
}
