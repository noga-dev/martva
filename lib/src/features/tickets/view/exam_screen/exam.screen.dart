import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/theme/repo/theme.repo.dart';
import 'package:martva/src/core/theme/view/tokens/ds_duration_tokens.dart';
import 'package:martva/src/core/theme/view/tokens/ds_spacing_tokens.dart';
import 'package:martva/src/core/utils/messaging/toaster.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/exam_screen/exam.controller.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/ticket_card_organism.dart';

class ExamScreen extends ConsumerWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examState = ref.watch(examScreenControllerProvider);

    return examState.tickets.when(
      data: (_) => const ExamContent(),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) => Scaffold(
        body: Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

class ExamContent extends HookConsumerWidget {
  const ExamContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examState = ref.watch(examScreenControllerProvider);
    final controller = ref.read(examScreenControllerProvider.notifier);
    final questionPageController =
        usePageController(initialPage: examState.currentQuestionIndex);

    useEffect(() {
      questionPageController.addListener(() {
        if (questionPageController.page != null) {
          controller.goToQuestion(questionPageController.page!.round());
        }
      });
      return null;
    }, []);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          flexibleSpace: DecoratedBox(
            decoration: const BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [
                //     Theme.of(context).scaffoldBackgroundColor,
                //     Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                //     Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                //   ],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   stops: const [
                //     0,
                //     0.75,
                //     1,
                //   ],
                // ),
                ),
            child: Padding(
              padding: DSSpacingTokens.s.all,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const BackButton(),
                  Text(
                      'Exam - Question ${examState.currentQuestionIndex + 1}/${examState.userAnswers.length}'),
                  Text(
                    '${examState.timeLeft.inMinutes}:${(examState.timeLeft.inSeconds % 60).toString().padLeft(2, '0')}',
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () => showModalBottomSheet(
                      enableDrag: true,
                      showDragHandle: true,
                      context: context,
                      builder: (context) => const _SettingsBottomSheet(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: questionPageController,
                  itemCount: examState.userAnswers.length,
                  itemBuilder: (context, index) => TicketCardOrganism(
                    ticket: examState.tickets.value![index],
                    userAnswer: examState.userAnswers
                        .map((answer) => (
                              answer: answer.selectedAnswer,
                              index: answer.selectedAnswerIndex,
                              showExplanation: answer.showExplanation,
                              ticket: answer.ticket,
                            ))
                        .toList()[index],
                    onAnswerSelected: (ticket, answer) =>
                        controller.answerQuestion(
                      ticket,
                      answer,
                    ),
                    // onExplanationToggled: () =>
                    //     controller.toggleExplanation(index),
                  ),
                ),
              ),
              _QuestionIndexDotIndicatorsWidget(
                currentQuestionIndex: examState.currentQuestionIndex,
                currentTicket:
                    examState.tickets.value![examState.currentQuestionIndex],
                examTickets: examState.tickets.value!,
                userAnswers: examState.userAnswers
                    .map((answer) => (
                          answer: answer.selectedAnswer,
                          index: answer.selectedAnswerIndex,
                          showExplanation: answer.showExplanation,
                          ticket: answer.ticket,
                        ))
                    .toList(),
                onTap: (index) {
                  controller.goToQuestion(index);
                  questionPageController.animateToPage(
                    index,
                    duration: DurationTokens.shortest,
                    curve: Curves.linear,
                  );
                },
              ),
            ],
          ),
        ]));
  }
}

class _QuestionIndexDotIndicatorsWidget extends StatelessWidget {
  const _QuestionIndexDotIndicatorsWidget({
    required this.currentTicket,
    required this.examTickets,
    required this.currentQuestionIndex,
    required this.userAnswers,
    required this.onTap,
  });

  final TicketDto currentTicket;
  final List<TicketDto> examTickets;
  final int currentQuestionIndex;
  final Function(int index) onTap;
  final List<
      ({
        AnswerDto? answer,
        int? index,
        bool showExplanation,
        TicketDto ticket
      })> userAnswers;

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        mainAxisSpacing: DSSpacingTokens.s.value,
        crossAxisSpacing: DSSpacingTokens.s.value,
      ),
      padding: DSSpacingTokens.xxxl.all,
      children: List.generate(examTickets.length, (index) {
        Color dotColor = Colors.grey.withOpacity(0.5);

        if (userAnswers[index].answer != null) {
          dotColor = (userAnswers[index].answer?.correct ?? false)
              ? Colors.green.withOpacity(0.5)
              : Colors.red.withOpacity(0.5);
        }

        return Stack(
          children: [
            AnimatedContainer(
              curve: Curves.easeOut,
              duration: DurationTokens.shortest,
              padding: EdgeInsets.all(currentQuestionIndex == index ? 4 : 8),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(4),
                color: dotColor,
                border: Border.all(
                  color: index == currentQuestionIndex
                      ? Colors.blueAccent
                      : Colors.transparent,
                  width: 4,
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onTap(index),
                onLongPress: () =>
                    Toaster.info('Current question #${currentTicket.id}'),
                child: Center(
                  child: Text(
                    '$index',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _SettingsBottomSheet extends HookConsumerWidget {
  const _SettingsBottomSheet();

  @override
  Widget build(BuildContext context, ref) {
    final ticketTranslationSource = ref.watch(ticketTranslationNotiferProvider);
    final ticketTranslationSourcceNotifier =
        ref.read(ticketTranslationNotiferProvider.notifier);
    final theme = ref.watch(themeRepoProvider);
    final themeNotifier = ref.watch(themeRepoProvider.notifier);
    final animationController = useAnimationController();

    return BottomSheet(
      animationController: animationController,
      onClosing: () => Toaster.info('Closing settings'),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Translation source'),
                trailing: DropdownButton<TicketTranslation>(
                  onChanged: (value) =>
                      ticketTranslationSourcceNotifier.update(value!),
                  hint: Text(ticketTranslationSource.name),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  elevation: 0,
                  items: TicketTranslation.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                ),
              ),
              CheckboxListTile(
                value: false,
                onChanged: (value) {},
                title: const Text('Auto Advance'),
              ),
              theme.when(
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
                data: (theme) => ListTile(
                  title: const Text('Appearance'),
                  trailing: SegmentedButton<ThemeMode>(
                    selected: {theme.mode},
                    multiSelectionEnabled: false,
                    showSelectedIcon: false,
                    emptySelectionAllowed: false,
                    onSelectionChanged: (val) {
                      themeNotifier.apply(val.first);
                    },
                    segments: const [
                      ButtonSegment(
                        value: ThemeMode.system,
                        icon: Icon(Icons.brightness_auto),
                      ),
                      ButtonSegment(
                        value: ThemeMode.light,
                        icon: Icon(Icons.brightness_7),
                      ),
                      ButtonSegment(
                        value: ThemeMode.dark,
                        icon: Icon(Icons.brightness_3),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
