import 'package:martva/src/core/features/auth/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'progress_service.g.dart';

@riverpod
class ProgressService extends _$ProgressService {
  @override
  Future<Map<String, dynamic>> build() async {
    final user = ref.watch(authServiceProvider);
    if (user == null) return {};

    final response = await Supabase.instance.client
        .from('user_progress')
        .select()
        .eq('user_id', user.id)
        .single();

    return response;
  }

  Future<void> updateProgress(String ticketId, bool isCorrect) async {
    final user = ref.read(authServiceProvider);

    if (user == null) return;

    final currentProgress = await future;
    final answeredTickets =
        List<String>.from(currentProgress['answered_tickets'] ?? []);
    final correctTickets =
        List<String>.from(currentProgress['correct_tickets'] ?? []);

    if (!answeredTickets.contains(ticketId)) {
      answeredTickets.add(ticketId);
    }

    if (isCorrect && !correctTickets.contains(ticketId)) {
      correctTickets.add(ticketId);
    }

    await Supabase.instance.client.from('user_progress').upsert({
      'user_id': user.id,
      'answered_tickets': answeredTickets,
      'correct_tickets': correctTickets,
    });

    state = AsyncData({
      ...currentProgress,
      'answered_tickets': answeredTickets,
      'correct_tickets': correctTickets,
    });
  }
}
