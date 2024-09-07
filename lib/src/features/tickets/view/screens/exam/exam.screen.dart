import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/theme/view/atoms/error_message.atom.dart';
import 'package:martva/src/core/theme/view/templates/shimmer.template.dart';
import 'package:martva/src/core/theme/view/tokens/ds_spacing_tokens.dart';
import 'package:martva/src/core/utils/constants.dart';
import 'package:martva/src/core/utils/methods/answer_color.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.controller.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.state.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/quick_settings_organism.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/ticket_card_organism.dart';

class ExamScreen extends HookConsumerWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenState = ref.watch(examControllerProvider);

    return screenState.when(
      loading: () => _ExamBody(
        screenState: ExamState.skeleton(),
        isLoading: true,
      ),
      error: (e, __) => Center(child: ErrorMessageAtom(e.toString())),
      data: (state) => _ExamBody(
        screenState: state,
        isLoading: false,
      ),
    );
  }
}

class _ExamBody extends HookConsumerWidget {
  const _ExamBody({
    required this.screenState,
    required this.isLoading,
  });

  final ExamState screenState;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenController = ref.read(examControllerProvider.notifier);
    final pageController = usePageController(
      initialPage: screenState.currentQuestionIndex,
      keepPage: false,
      keys: [screenState.currentQuestionIndex],
    );

    useEffect(() {
      void listener() {
        final newIndex = pageController.page?.round() ?? 0;
        if (newIndex != screenState.currentQuestionIndex) {
          screenController.setQuestionIndex(newIndex);
        }
      }

      pageController.addListener(listener);
      return () => pageController.removeListener(listener);
    }, [pageController]);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (pageController.hasClients &&
            (pageController.page?.round() ?? 0) !=
                screenState.currentQuestionIndex) {
          pageController.animateToPage(
            screenState.currentQuestionIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        }
      });
      return null;
    }, [screenState.currentQuestionIndex, pageController]);

    return Scaffold(
      drawer: const QuickSettingsOrganism(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ShimmerTemplate(
          enabled: isLoading,
          child: Row(
            children: [
              const BackButton(),
              const Text('Exam'),
              const Spacer(),
              _TimerWidget(),
              const Spacer(),
              _QuestionIndexWidget(screenState: screenState),
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
        screenState: screenState,
      ),
      bottomNavigationBar: _NavigationButtons(pageController: pageController),
    );
  }
}

class _TicketListTemplate extends ConsumerWidget {
  const _TicketListTemplate({
    required this.isLoading,
    required this.pageController,
    required this.screenState,
  });

  final bool isLoading;
  final PageController pageController;
  final ExamState screenState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenController = ref.read(examControllerProvider.notifier);

    return ShimmerTemplate(
      enabled: isLoading,
      child: PageView.builder(
        controller: pageController,
        itemCount: screenState.solutions.length,
        itemBuilder: (context, pageIndex) {
          return TicketCardOrganism(
            question: screenState.solutions[pageIndex],
            onAnswerSelected:
                screenState.solutions[pageIndex].selectedAnswer == null
                    ? (answer) {
                        if (answer == null) {
                          return;
                        }

                        screenController.selectAnswer(
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
    required this.screenState,
  });

  final ExamState screenState;

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
            itemCount: screenState.solutions.length,
            padding: DSSpacingTokens.s.allInsets,
            itemBuilder: (context, index) => TextButton(
              style: TextButton.styleFrom(
                backgroundColor: getAnswerColor(
                  answer: null,
                  solution: screenState.solutions[index].selectedAnswer,
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
          Text('${screenState.currentQuestionIndex + 1}'
              '/'
              '${screenState.solutions.length}'),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      '${screenState.solutions.where((e) => e.selectedAnswer?.correct ?? false).length}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.green),
                ),
                const TextSpan(text: '/'),
                TextSpan(
                  text:
                      '${screenState.solutions.where((e) => e.selectedAnswer?.correct == false).length}',
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
