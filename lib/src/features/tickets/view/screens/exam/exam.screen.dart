import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/theme/view/atoms/error_message.atom.dart';
import 'package:martva/src/core/theme/view/tokens/ds_spacing_tokens.dart';
import 'package:martva/src/core/utils/constants.dart';
import 'package:martva/src/core/utils/methods/answer_color.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.controller.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.state.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/quick_settings_organism.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/ticket_card_organism.dart';
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
      drawer: const QuickSettingsOrganism(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Skeletonizer(
          enabled: isLoading,
          ignorePointers: isLoading,
          enableSwitchAnimation: true,
          child: Row(
            children: [
              const BackButton(),
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
      body: _TicketListTemplate(
        isLoading: isLoading,
        pageController: pageController,
        examState: examState,
      ),
      bottomNavigationBar: _NavigationButtons(pageController: pageController),
    );
  }
}

class _TicketListTemplate extends ConsumerWidget {
  const _TicketListTemplate({
    required this.isLoading,
    required this.pageController,
    required this.examState,
  });

  final bool isLoading;
  final PageController pageController;
  final ExamState examState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Skeletonizer(
      enabled: isLoading,
      enableSwitchAnimation: true,
      child: PageView.builder(
        controller: pageController,
        itemCount: examState.solutions.length,
        itemBuilder: (context, pageIndex) {
          return TicketCardOrganism(
            question: examState.solutions[pageIndex],
            onAnswerSelected:
                examState.solutions[pageIndex].selectedAnswer == null
                    ? (answer) {
                        if (answer == null) {
                          return;
                        }

                        ref.read(examControllerProvider.notifier).selectAnswer(
                              pageIndex,
                              answer,
                            );
                      }
                    : null,
          );
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
                backgroundColor: getAnswerColor(
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
      child: Column(
        children: [
          Text('${examState.currentQuestionIndex + 1}'
              '/'
              '${examState.solutions.length}'),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      '${examState.solutions.where((e) => e.selectedAnswer?.correct ?? false).length}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.green),
                ),
                const TextSpan(text: '/'),
                TextSpan(
                  text:
                      '${examState.solutions.where((e) => e.selectedAnswer?.correct == false).length}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
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
