import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'mock_auth_service.g.dart';

@riverpod
class MockAuthService extends _$MockAuthService {
  @override
  User? build() => null;

  Future<void> signIn({required String email, required String password}) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock authentication logic
    if (email == 'a@b.c' && password == 'd') {
      state = User(
        id: '1',
        email: email,
        aud: '',
        createdAt: '',
        appMetadata: {},
        userMetadata: {
          'first_name': 'FirstN',
          'last_name': 'LastN',
        },
      );
    } else {
      throw Exception('Invalid email or password');
    }
  }

  Future<void> signOut() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    state = null;
  }

  // We'll implement signUp later
  Future<void> signUp({required String email, required String password}) async {
    throw UnimplementedError('Sign up not implemented in mock');
  }
}
