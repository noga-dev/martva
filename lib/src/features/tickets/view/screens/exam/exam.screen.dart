// exam_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/theme/view/tokens/ds_spacing_tokens.dart';
import 'package:martva/src/core/utils/extensions/list.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.controller.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.state.dart';
import 'package:martva/src/features/tickets/view/shared/molecules/ticket_image_molecule.dart';

class ExamScreen extends HookConsumerWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examState = ref.watch(examControllerProvider);
    final pageController = usePageController(
        initialPage: examState.currentQuestionIndex,
        keepPage: false,
        keys: [examState.currentQuestionIndex]);

    useEffect(() {
      void listener() {
        final newIndex = pageController.page?.round() ?? 0;
        if (newIndex != examState.currentQuestionIndex) {
          ref.read(examControllerProvider.notifier).setQuestionIndex(newIndex);
        }
      }

      pageController.addListener(listener);
      return () => pageController.removeListener(listener);
    }, [pageController]);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Exam'),
            const Spacer(),
            _TimerWidget(),
            const Spacer(),
            _QuestionIndexWidget(examState: examState),
            Builder(builder: (context) {
              return IconButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  builder: (context) => const _SettingsBottomSheet(),
                ),
                icon: const Icon(Icons.settings),
              );
            }),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: examState.solutions.map((question) {
              return SizedBox(
                height: 2,
                width: MediaQuery.of(context).size.width /
                    examState.solutions.length,
                child: ColoredBox(
                  color: question.selectedAnswer == null
                      ? Colors.grey
                      : question.selectedAnswer!.correct
                          ? Colors.green
                          : Colors.red,
                ),
              );
            }).toList(),
          ),
        ),
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

class _SettingsBottomSheet extends StatelessWidget {
  const _SettingsBottomSheet();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      onClosing: () {},
      builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _TranslationDropdownWidget(),
          ]
              .map((e) => Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class _QuestionIndexWidget extends ConsumerWidget {
  const _QuestionIndexWidget({
    required this.examState,
  });

  final ExamState examState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) => Dialog(
          alignment: Alignment.center,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: DSSpacingTokens.s.value,
              mainAxisSpacing: DSSpacingTokens.s.value,
            ),
            shrinkWrap: true,
            itemCount: examState.solutions.length,
            padding: DSSpacingTokens.s.allInsets,
            itemBuilder: (context, index) {
              return TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: _getAnswerColor(
                    examState.solutions[index].selectedAnswer?.correct,
                    examState.solutions[index].ticket.answers.first,
                    examState.solutions[index],
                  ),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => ref
                    .read(examControllerProvider.notifier)
                    .setQuestionIndex(index),
                child: Text(
                  index.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            },
          ),
        ),
      ),
      child: Text(
          '${examState.currentQuestionIndex + 1}/${examState.solutions.length}'),
    );
  }
}

class _TimerWidget extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeLeft =
        ref.watch(examControllerProvider.select((state) => state.timeLeft));

    return Text(
      '${timeLeft.inMinutes}:${(timeLeft.inSeconds % 60).toString().padLeft(2, '0')}',
    );
  }
}

class _TranslationDropdownWidget extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      leading: const Icon(Icons.translate),
      visualDensity: VisualDensity.compact,
      title: SegmentedButton(
        selected: {ref.watch(ticketTranslationNotiferProvider)},
        showSelectedIcon: false,
        segments: TicketTranslation.values.map((TicketTranslation translation) {
          return ButtonSegment(
            value: translation,
            label: Text(translation.name),
          );
        }).toList(),
        onSelectionChanged: (Set<TicketTranslation> newValue) {
          if (newValue.isNotEmpty) {
            ref
                .read(ticketTranslationNotiferProvider.notifier)
                .update(newValue.first);
          }
        },
      ),
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
    final ticketTranslation = ref.watch(ticketTranslationNotiferProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(currentQuestion.ticket.question),
          const SizedBox(height: 16),
          if (currentQuestion.ticket.image.isNotEmpty)
            TicketImageMolecule(
              ticket: currentQuestion.ticket,
            ),
          const SizedBox(height: 16),
          ...currentQuestion.ticket.answers.map<Widget>((answer) {
            final isCorrect = currentQuestion.selectedAnswer?.correct;

            return RadioListTile.adaptive(
              value: answer.ordinal,
              groupValue: currentQuestion.selectedAnswer?.ordinal,
              onChanged: currentQuestion.selectedAnswer == null
                  ? (val) {
                      ref.read(examControllerProvider.notifier).selectAnswer(
                            questionIndex,
                            answer,
                          );
                    }
                  : null,
              fillColor: WidgetStateProperty.all(
                _getAnswerColor(
                  isCorrect,
                  answer,
                  currentQuestion,
                ),
              ),
              dense: true,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                  width: 1,
                  color: _getAnswerColor(
                    isCorrect,
                    answer,
                    currentQuestion,
                  ),
                ),
              ),
              title: Text(
                answer.answer,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }).intersperse(DSSpacingTokens.xxl.verticalBox),
          if (currentQuestion.showExplanation) ...[
            const SizedBox(height: 16),
            Text(
              'Explanation:',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(currentQuestion.ticket.explanation.isEmpty
                ? 'No explanation from ${ticketTranslation.name}.'
                    ' Change source in settings.'
                : currentQuestion.ticket.explanation),
          ],
        ],
      ),
    );
  }
}

Color _getAnswerColor(
  bool? isCorrect,
  AnswerDto answer,
  QuestionState currentQuestion,
) {
  return isCorrect == null
      ? Colors.grey
      : answer.correct
          ? Colors.green
          : answer.ordinal == currentQuestion.selectedAnswer?.ordinal
              ? Colors.red
              : Colors.grey;
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
          Expanded(
            child: TextButton(
              onPressed: currentIndex > 0
                  ? () => pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                  : null,
              child: const Text('Previous'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () => examController.toggleExplanation(currentIndex),
              child: const Text('Explain'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: currentIndex < totalQuestions - 1
                  ? () => pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                  : null,
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
