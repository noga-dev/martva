// File: lib/features/auth/presentation/notifiers/auth_notifier.dart
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../data/repositories/auth_repository.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  User? build() {
    _listenToAuthStateChanges();
    return null;
  }

  void _listenToAuthStateChanges() {
    ref.listen(authRepositoryProvider, (previous, next) {
      next.authStateChanges().listen((event) {
        state = event.session?.user;
      });
    });
  }

  Future<void> signIn(String email, String password) async {
    final authRepository = ref.read(authRepositoryProvider);
    try {
      await authRepository.signIn(email: email, password: password);
      BotToast.showText(text: 'Signed in successfully');
    } catch (e) {
      BotToast.showText(
          text: 'Sign in failed: ${e.toString()}', contentColor: Colors.red);
    }
  }

  Future<void> signUp(String email, String password) async {
    final authRepository = ref.read(authRepositoryProvider);
    try {
      await authRepository.signUp(email: email, password: password);
      BotToast.showText(text: 'Signed up successfully');
    } catch (e) {
      BotToast.showText(
          text: 'Sign up failed: ${e.toString()}', contentColor: Colors.red);
    }
  }

  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);
    try {
      await authRepository.signOut();
      BotToast.showText(text: 'Signed out successfully');
    } catch (e) {
      BotToast.showText(
          text: 'Sign out failed: ${e.toString()}', contentColor: Colors.red);
    }
  }
}
