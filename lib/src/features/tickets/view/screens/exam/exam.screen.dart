// exam_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.controller.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.state.dart';
import 'package:martva/src/features/tickets/view/shared/molecules/ticket_image_molecule.dart';

class ExamScreen extends HookConsumerWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examState = ref.watch(examControllerProvider);
    final pageController =
        usePageController(initialPage: examState.currentQuestionIndex);

    useEffect(() {
      pageController.addListener(() {
        final newIndex = pageController.page?.round() ?? 0;
        if (newIndex != examState.currentQuestionIndex) {
          ref.read(examControllerProvider.notifier).setQuestionIndex(newIndex);
        }
      });
      return null;
    }, [pageController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam'),
        actions: [
          _TimerWidget(),
          _TranslationDropdown(),
        ],
      ),
      body: examState.solutions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : PageView.builder(
              controller: pageController,
              itemCount: examState.solutions.length,
              itemBuilder: (context, index) {
                return _ExamContent(
                  examState: examState,
                  questionIndex: index,
                );
              },
            ),
      bottomNavigationBar: _NavigationButtons(pageController: pageController),
    );
  }
}

class _TimerWidget extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeLeft =
        ref.watch(examControllerProvider.select((state) => state.timeLeft));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        '${timeLeft.inMinutes}:${(timeLeft.inSeconds % 60).toString().padLeft(2, '0')}',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _TranslationDropdown extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton<TicketTranslation>(
      underline: const SizedBox.shrink(),
      value: ref.watch(ticketTranslationNotiferProvider),
      onChanged: (TicketTranslation? newValue) {
        if (newValue != null) {
          ref.read(ticketTranslationNotiferProvider.notifier).update(newValue);
        }
      },
      items: TicketTranslation.values.map((TicketTranslation translation) {
        return DropdownMenuItem<TicketTranslation>(
          value: translation,
          child: Text(translation.toString().split('.').last),
        );
      }).toList(),
    );
  }
}

class _ExamContent extends HookConsumerWidget {
  final ExamState examState;
  final int questionIndex;

  const _ExamContent({required this.examState, required this.questionIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentQuestion = examState.solutions[questionIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question ${questionIndex + 1}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(currentQuestion.ticket.question),
          const SizedBox(height: 16),
          TicketImageMolecule(
            ticket: currentQuestion.ticket,
          ),
          const SizedBox(height: 16),
          ...currentQuestion.ticket.answers.map((answer) {
            final isSelected = currentQuestion.selectedAnswer == answer;
            return GestureDetector(
              onTap: () {
                ref.read(examControllerProvider.notifier).selectAnswer(
                      questionIndex,
                      answer,
                    );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Text(answer.answer)),
                  ],
                ),
              ),
            );
          }),
          if (currentQuestion.showExplanation) ...[
            const SizedBox(height: 16),
            Text(
              'Explanation:',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(currentQuestion.ticket.explanation),
          ],
        ],
      ),
    );
  }
}

class _NavigationButtons extends HookConsumerWidget {
  final PageController pageController;

  const _NavigationButtons({required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examController = ref.watch(examControllerProvider.notifier);
    final currentIndex = ref.watch(
        examControllerProvider.select((state) => state.currentQuestionIndex));
    final totalQuestions = ref.watch(
        examControllerProvider.select((state) => state.solutions.length));

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: currentIndex > 0
                ? () => pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    )
                : null,
            child: const Text('Previous'),
          ),
          TextButton(
            onPressed: () => examController.toggleExplanation(currentIndex),
            child: const Text('Show Explanation'),
          ),
          TextButton(
            onPressed: currentIndex < totalQuestions - 1
                ? () => pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    )
                : null,
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
