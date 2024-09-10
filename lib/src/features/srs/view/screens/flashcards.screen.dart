// lib/src/features/srs/view/screens/flashcards.screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/theme/view/templates/shimmer.template.dart';
import 'package:martva/src/features/srs/dto/flashcard.dto.dart';
import 'package:martva/src/features/srs/view/screens/flashcards.controller.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/quick_settings_organism.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/ticket_card_organism.dart';

class FlashcardsScreen extends HookConsumerWidget {
  const FlashcardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(flashcardsControllerProvider);
    final controller = ref.read(flashcardsControllerProvider.notifier);
    final pageController = usePageController();
    final lastFlashcard = useState<FlashcardDto?>(null);

    return Scaffold(
      drawer: const QuickSettingsOrganism(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ShimmerTemplate(
          enabled: state.isLoading,
          child: Row(
            children: [
              const BackButton(),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'SRS'),
                            const TextSpan(text: ' - '),
                            const TextSpan(text: 'Question '),
                            const TextSpan(text: ' '),
                            TextSpan(
                              text:
                                  state.valueOrNull?.currentTicketIndex == null
                                      ? 'no index'
                                      : state
                                          .value
                                          ?.tickets[
                                              state.value!.currentTicketIndex!]
                                          .ordinalId
                                          .toString(),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Builder(builder: (context) {
                        return IconButton(
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          icon: const Icon(Icons.settings),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ShimmerTemplate(
        enabled: state.isLoading,
        child: state.value?.tickets.isEmpty ?? false
            ? Center(
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
              )
            : state.isLoading
                ? TicketCardOrganism(
                    question: QuestionState.skeleton(),
                    onAnswerSelected: (answer) {},
                  )
                : PageView(
                    controller: pageController,
                    children: state.value!.tickets
                        .map(
                          (e) => HookBuilder(builder: (context) {
                            final selectedAnswer = useState<AnswerDto?>(null);
                            final showExplanation = useState(false);

                            return TicketCardOrganism(
                              question: QuestionState(
                                ticket: e,
                                selectedAnswer: selectedAnswer.value,
                                showExplanation: showExplanation.value,
                              ),
                              onAnswerSelected: (answer) async {
                                if (answer == null) {
                                  return;
                                }

                                lastFlashcard.value = await controller
                                    .answerCurrentFlashcard(answer.id);

                                selectedAnswer.value = answer;

                                if (!answer.correct) {
                                  showExplanation.value = true;
                                }

                                Future.delayed(
                                  const Duration(milliseconds: 500),
                                  () {
                                    if (context.mounted) {
                                      pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          }),
                        )
                        .toList(),
                  ),
      ),
    );
  }
}
