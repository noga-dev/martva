// File: lib/data/repositories/auth_repository.dart
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'mock_auth_repository.dart';

part 'auth_repository.g.dart';

abstract class AuthRepository {
  Stream<AuthState> authStateChanges();
  Future<void> signIn({required String email, required String password});
  Future<void> signUp({required String email, required String password});
  Future<void> signOut();
}

class SupabaseAuthRepository implements AuthRepository {
  final SupabaseClient _client;

  SupabaseAuthRepository(this._client);

  @override
  Stream<AuthState> authStateChanges() => _client.auth.onAuthStateChange;

  @override
  Future<void> signIn({required String email, required String password}) async {
    await _client.auth.signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    await _client.auth.signUp(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _client.auth.signOut();
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final useMockData = ref.watch(useMockDataProvider);
  if (useMockData) {
    return MockAuthRepository();
  } else {
    return SupabaseAuthRepository(Supabase.instance.client);
  }
}

// Provider to control whether to use mock data
final useMockDataProvider = StateProvider<bool>((ref) => false);
