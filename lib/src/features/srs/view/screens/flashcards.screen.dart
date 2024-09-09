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
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.hasError
              ? Center(child: Text('Error: ${state.error}'))
              : state.valueOrNull?.currentTicket == null
                  ? const Center(child: Text('No more flashcards due'))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.value!.currentTicket!.question,
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 20),
                        ...state.value!.currentTicket!.answers
                            .map((answer) => ElevatedButton(
                                  onPressed: () => controller
                                      .answerCurrentFlashcard(answer.id),
                                  child: Text(answer.answer),
                                )),
                      ],
                    ),
    );
  }
}
