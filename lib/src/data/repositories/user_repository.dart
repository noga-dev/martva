// File: lib/data/repositories/user_repository.dart
import 'package:martva/src/core/supabase/supabase.c.dart';
import 'package:martva/src/data/models/user_progress.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_repository.g.dart';

abstract class UserRepository {
  Future<void> saveUserProgress(UserProgressDto progress);
  Future<UserProgressDto?> getUserProgress(String userId);
}

class SupabaseUserRepository implements UserRepository {
  final SupabaseClient _client;

  SupabaseUserRepository(this._client);

  @override
  Future<void> saveUserProgress(UserProgressDto progress) async {
    await _client
        .from('user_progress')
        .upsert(progress.toJson(), onConflict: 'user_id');
  }

  @override
  Future<UserProgressDto?> getUserProgress(String userId) async {
    final response = await _client
        .from('user_progress')
        .select()
        .eq('user_id', userId)
        .single();

    return UserProgressDto.fromJson(response);
  }
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseUserRepository(client);
}
