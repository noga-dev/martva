// exam_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/i18n/data/localization.repo.dart';
import 'package:martva/src/core/theme/view/atoms/error_message.atom.dart';
import 'package:martva/src/core/theme/view/tokens/ds_duration_tokens.dart';
import 'package:martva/src/core/theme/view/tokens/ds_spacing_tokens.dart';
import 'package:martva/src/core/utils/constants.dart';
import 'package:martva/src/core/utils/extensions/list.dart';
import 'package:martva/src/core/utils/messaging/toaster.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.controller.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.state.dart';
import 'package:martva/src/features/tickets/view/shared/molecules/ticket_image_molecule.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExamScreen extends HookConsumerWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examStateAsync = ref.watch(examControllerProvider);

    return examStateAsync.when(
      loading: () => _ExamBody(
        examState: ExamState.skeleton(),
        isLoading: true,
      ),
      error: (e, __) => Center(child: ErrorMessageAtom(e.toString())),
      data: (examState) => _ExamBody(
        examState: examState,
        isLoading: false,
      ),
    );
  }
}

class _ExamBody extends HookConsumerWidget {
  const _ExamBody({
    required this.examState,
    required this.isLoading,
  });

  final ExamState examState;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController(
      initialPage: examState.currentQuestionIndex,
      keepPage: false,
      keys: [examState.currentQuestionIndex],
    );

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

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (pageController.hasClients &&
            (pageController.page?.round() ?? 0) !=
                examState.currentQuestionIndex) {
          pageController.animateToPage(
            examState.currentQuestionIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        }
      });
      return null;
    }, [examState.currentQuestionIndex, pageController]);

    return Scaffold(
      drawer: const _SettingsBottomSheet(),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Skeletonizer(
          enabled: isLoading,
          ignorePointers: isLoading,
          enableSwitchAnimation: true,
          child: Row(
            children: [
              const Text('Exam'),
              const Spacer(),
              _TimerWidget(),
              const Spacer(),
              _QuestionIndexWidget(examState: examState),
              Builder(builder: (context) {
                return IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(Icons.settings),
                );
              }),
            ],
          ),
        ),
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(0),
        //   child: GridView.builder(
        //     shrinkWrap: true,
        //     physics: const NeverScrollableScrollPhysics(),
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 15,
        //       crossAxisSpacing: 0,
        //       mainAxisSpacing: 0,
        //       childAspectRatio: MediaQuery.of(context).devicePixelRatio * 6,
        //     ),
        //     itemCount: examState.solutions.length,
        //     itemBuilder: (context, index) {
        //       return DecoratedBox(
        //         decoration: BoxDecoration(
        //           color: _getAnswerColor(
        //             answer: null,
        //             solution: examState.solutions[index].selectedAnswer,
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ),
      body: Skeletonizer(
        enabled: isLoading,
        ignorePointers: isLoading,
        enableSwitchAnimation: true,
        child: PageView.builder(
          controller: pageController,
          itemCount: examState.solutions.length,
          itemBuilder: (context, index) {
            return _TicketWidget(
              examState: examState,
              questionIndex: index,
            );
          },
        ),
      ),
      bottomNavigationBar: _NavigationButtons(pageController: pageController),
    );
  }
}

class _SettingsBottomSheet extends HookWidget {
  const _SettingsBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: DSSpacingTokens.m.allInsets,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _TranslationDropdownWidget(),
              const _LanguageDropdownWidget(),
              ListTile(
                title: const Text('Randomize answer order'),
                trailing: Switch(
                  value: false,
                  onChanged: (value) => Toaster.unimplemented(),
                ),
              ),
              ListTile(
                title: const Text('Auto next on correct answer'),
                trailing: Switch(
                  value: false,
                  onChanged: (value) => Toaster.unimplemented(),
                ),
              ),
              ListTile(
                title: const Text('Show explanation on correct answer'),
                trailing: Switch(
                  value: false,
                  onChanged: (value) => Toaster.unimplemented(),
                ),
              ),
            ]
                .map((e) => Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child: e,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _LanguageDropdownWidget extends ConsumerWidget {
  const _LanguageDropdownWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(localizationRepoProvider);
    final trans = ref.watch(ticketTranslationNotiferProvider);

    return ListTile(
      // titleAlignment: ListTileTitleAlignment.center,
      // leading: const Icon(Icons.language_sharp),
      title: SegmentedButton<SupportedLocale>(
        style: SegmentedButton.styleFrom(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.standard,
        ),
        showSelectedIcon: false,
        selected: {lang},
        segments: SupportedLocale.values.map((SupportedLocale locale) {
          return ButtonSegment(
            value: locale,
            label: Text(locale.name),
          );
        }).toList(),
        onSelectionChanged: (Set<SupportedLocale> newValue) {
          if (newValue.isNotEmpty) {
            if (newValue.first == SupportedLocale.ge &&
                trans == TicketTranslation.gpt4oMini) {
              Toaster.info(
                  r'''Georgian is the original, so there's no Martva translation. Switching to English.''');
              ref
                  .read(ticketTranslationNotiferProvider.notifier)
                  .update(TicketTranslation.original);
            }
            ref.read(localizationRepoProvider.notifier).update(newValue.first);
            // Navigator.of(context).pop();
          }
        },
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
            itemBuilder: (context, index) => TextButton(
              style: TextButton.styleFrom(
                backgroundColor: _getAnswerColor(
                  answer: null,
                  solution: examState.solutions[index].selectedAnswer,
                ),
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                ref
                    .read(examControllerProvider.notifier)
                    .setQuestionIndex(index);

                Navigator.of(context).pop();
              },
              child: Text(
                (index + 1).toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
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
    final timeLeft = ref.watch(
            examControllerProvider.select((state) => state.value?.timeLeft)) ??
        Constants.examTicketsTime;

    return Text(
      '${timeLeft.inMinutes}:${(timeLeft.inSeconds % 60).toString().padLeft(2, '0')}',
    );
  }
}

class _TranslationDropdownWidget extends HookConsumerWidget {
  const _TranslationDropdownWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trans = ref.watch(ticketTranslationNotiferProvider);
    final lang = ref.watch(localizationRepoProvider);

    return ListTile(
      // titleAlignment: ListTileTitleAlignment.center,
      // leading: const Icon(Icons.translate),
      title: SegmentedButton(
        style: SegmentedButton.styleFrom(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.standard,
        ),
        selected: {trans},
        showSelectedIcon: false,
        segments: TicketTranslation.values.map((TicketTranslation translation) {
          return ButtonSegment(
            value: translation,
            label: Text(translation.name),
          );
        }).toList(),
        onSelectionChanged: (Set<TicketTranslation> newValue) {
          if (newValue.isNotEmpty) {
            if (newValue.first == TicketTranslation.gpt4oMini &&
                lang == SupportedLocale.ge) {
              Toaster.info(
                  r'''There is no Georgian with Martva's translation. Switching to English.''');
              ref
                  .read(localizationRepoProvider.notifier)
                  .update(SupportedLocale.en);
            }
            ref
                .read(ticketTranslationNotiferProvider.notifier)
                .update(newValue.first);
            // Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}

class _TicketWidget extends HookConsumerWidget {
  final ExamState examState;
  final int questionIndex;

  const _TicketWidget({
    required this.examState,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentQuestion = examState.solutions[questionIndex];
    final ticketTranslation = ref.watch(ticketTranslationNotiferProvider);

    return SingleChildScrollView(
      padding: DSSpacingTokens.xl.allInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSize(
            duration: DSDurationTokens.xxxs.duration,
            reverseDuration: DSDurationTokens.xxxs.duration,
            curve: Curves.linear,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: currentQuestion.showExplanation
                  ? [
                      Card(
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: DSSpacingTokens.m.allInsets,
                          child: Text(
                            currentQuestion.ticket.explanation.isEmpty
                                ? 'No explanation from ${ticketTranslation.name}.'
                                    ' Change source in settings.'
                                : currentQuestion.ticket.explanation,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      DSSpacingTokens.l.verticalBox,
                    ]
                  : [const SizedBox.shrink()],
            ),
          ),
          Text(currentQuestion.ticket.question),
          DSSpacingTokens.xxl.verticalBox,
          if (currentQuestion.ticket.image.isNotEmpty) ...[
            TicketImageMolecule(
              ticket: currentQuestion.ticket,
            ),
            DSSpacingTokens.xxl.verticalBox,
          ],
          ...currentQuestion.ticket.answers.map<Widget>((answer) {
            return Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: _getAnswerColor(
                    answer: answer,
                    solution: currentQuestion.selectedAnswer,
                  ),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: RadioListTile.adaptive(
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
                    answer: answer,
                    solution: currentQuestion.selectedAnswer,
                  ),
                ),
                dense: true,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                title: Text(
                  answer.answer,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          }).intersperse(DSSpacingTokens.xxl.verticalBox),
        ],
      ),
    );
  }
}

Color _getAnswerColor({
  required AnswerDto? answer,
  required AnswerDto? solution,
}) {
  if (solution == null) {
    return Colors.grey.withOpacity(0.5);
  }

  if (answer == null) {
    if (solution.correct) {
      return Colors.green.withOpacity(0.5);
    }

    if (!solution.correct) {
      return Colors.red.withOpacity(0.5);
    }

    return Colors.grey.withOpacity(0.5);
  }

  // Incorrect answer selected by user
  if (answer.ordinal == solution.ordinal && !answer.correct) {
    return Colors.red.withOpacity(0.5);
  }

  // Correct answer (both selected and actual)
  if (answer.correct) {
    return Colors.green.withOpacity(0.5);
  }

  // Any other case (unselected incorrect answers)
  return Colors.grey.withOpacity(0.5);
}

class _NavigationButtons extends HookConsumerWidget {
  final PageController pageController;

  const _NavigationButtons({required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(examControllerProvider
            .select((state) => state.value?.currentQuestionIndex)) ??
        -1;
    final totalQuestions = ref.watch(examControllerProvider
            .select((state) => state.value?.solutions.length)) ??
        -1;

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextButton(
              onPressed: currentIndex > 0
                  ? () => pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      )
                  : null,
              child: const Text('Previous'),
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
