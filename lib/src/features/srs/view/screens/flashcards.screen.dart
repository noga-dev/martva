// lib/src/features/srs/view/screens/flashcards.screen.dart

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/features/srs/view/screens/flashcards.controller.dart';

class FlashcardsScreen extends ConsumerWidget {
  const FlashcardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(flashcardsControllerProvider);
    final controller = ref.read(flashcardsControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Flashcards')),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (data) {
          if (data.currentTicket == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No more flashcards due'),
                  ElevatedButton(
                    onPressed: () => controller.loadFlashcards(),
                    child: const Text('Check for new flashcards'),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.currentTicket!.question,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 20),
                ...data.currentTicket!.answers.map((answer) => ElevatedButton(
                      onPressed: () =>
                          controller.answerCurrentFlashcard(answer.id),
                      child: Text(answer.answer),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
