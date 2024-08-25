// File: lib/data/repositories/mock_auth_repository.dart
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  User? _currentUser;

  @override
  Stream<AuthState> authStateChanges() {
    return Stream.value(AuthState(
      AuthChangeEvent.signedIn,
      _currentUser != null
          ? Session(
              user: _currentUser!,
              accessToken: '',
              tokenType: '',
            )
          : null,
    ));
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = User(
      id: 'mock_user_id',
      email: email,
      appMetadata: {},
      userMetadata: {},
      aud: 'authenticated',
      createdAt: DateTime.now().toIso8601String(),
    );
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = User(
      id: 'mock_user_id',
      email: email,
      appMetadata: {},
      userMetadata: {},
      aud: 'authenticated',
      createdAt: DateTime.now().toIso8601String(),
    );
  }

  @override
  Future<void> signOut() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = null;
  }
}
