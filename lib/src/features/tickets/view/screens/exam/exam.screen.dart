import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:martva/src/core/theme/repo/theme.repo.dart';
import 'package:martva/src/core/theme/view/templates/async_value.widget.dart';
import 'package:martva/src/core/theme/view/tokens/ds_duration_tokens.dart';
import 'package:martva/src/core/theme/view/tokens/ds_size_tokens.dart';
import 'package:martva/src/core/theme/view/tokens/ds_spacing_tokens.dart';
import 'package:martva/src/core/utils/messaging/toaster.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.controller.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.state.dart';
import 'package:martva/src/features/tickets/view/shared/molecules/ticket_image_molecule.dart';

class ExamScreen extends HookConsumerWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examStateAsync = ref.watch(examScreenControllerProvider);
    return AsyncValueWidget(
      value: examStateAsync,
      data: (examState) => ExamContent(examState: examState),
    );
  }
}

class ExamContent extends HookConsumerWidget {
  const ExamContent({super.key, required this.examState});

  final ExamState examState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(examScreenControllerProvider.notifier);
    final questionPageController =
        usePageController(initialPage: examState.currentQuestionIndex);

    useEffect(() {
      void listener() {
        if (questionPageController.page != null) {
          controller.goToQuestion(questionPageController.page!.round());
        }
      }

      questionPageController.addListener(listener);
      return () => questionPageController.removeListener(listener);
    }, [questionPageController]);

    return Scaffold(
      appBar: _buildAppBar(context, examState),
      body: Stack(
        children: [
          _buildQuestionPageView(examState, questionPageController, controller),
          _buildNextButton(examState, controller),
          _buildExplanationButton(examState, controller),
          _buildPreviousButton(examState, controller),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, ExamState examState) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: Padding(
        padding: DSSpacingTokens.s.all,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BackButton(),
            Text(
                'Exam - Question ${examState.currentQuestionIndex + 1}/${examState.userAnswers.length}'),
            Text(
                '${examState.timeLeft.inMinutes}:${(examState.timeLeft.inSeconds % 60).toString().padLeft(2, '0')}'),
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
    );
  }

  Widget _buildQuestionPageView(ExamState examState,
      PageController questionPageController, ExamScreenController controller) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: questionPageController,
            itemCount: examState.userAnswers.length,
            itemBuilder: (context, index) => Padding(
              padding: DSSpacingTokens.xxxl.horizontal,
              child: ListView(
                shrinkWrap: true,
                children: [
                  // DSSpacingTokens.s.scaledVerticalSpace(10),
                  if (examState.tickets.value![index].image.isNotEmpty) ...[
                    Center(
                      child: TicketImageMolecule(
                        ticket: examState.tickets.value![index],
                      ),
                    ),
                    DSSpacingTokens.m.verticalSpace,
                  ],
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (examState.tickets.value![index].image.isEmpty)
                          const SizedBox(height: 12),
                        Text(
                          examState.tickets.value![index].question,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...[
                          AnimatedSwitcher(
                            switchInCurve: Curves.easeInOut,
                            switchOutCurve: Curves.easeInOut,
                            duration: DurationTokens.short,
                            transitionBuilder: (child, animation) =>
                                SizeTransition(
                              axis: Axis.vertical,
                              sizeFactor: animation,
                              child: child,
                            ),
                            child: examState.userAnswers[index].showExplanation
                                ? Center(
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      shadowColor: Colors.transparent,
                                      elevation: 0,
                                      child: Padding(
                                        padding: DSSpacingTokens.l.all,
                                        child: Text(
                                          examState.tickets.value![index]
                                                  .explanation.isEmpty
                                              ? 'No explanation from this source.'
                                                  '\n'
                                                  'Switch to another in settings.}'
                                              : examState.tickets.value![index]
                                                  .explanation,
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                            height: 1.6,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ],
                    ),
                  ),
                  DSSpacingTokens.m.verticalSpace,
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width >= 800
                          ? examState.tickets.value![index].answers.length == 3
                              ? 3
                              : 2
                          : 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 160 +
                          examState.tickets.value![index].answers.fold(
                                0,
                                (previousValue, element) =>
                                    previousValue + element.answer.length,
                              ) /
                              examState.tickets.value![index].answers.length,
                    ),
                    children: List.generate(
                      examState.tickets.value![index].answers.length,
                      (index) => Stack(
                        fit: StackFit.expand,
                        children: [
                          IgnorePointer(
                            ignoring:
                                examState.userAnswers[index].selectedAnswer !=
                                    null,
                            child: FilledButton(
                              onPressed: () => controller.answerQuestion(
                                  examState.tickets.value![index],
                                  examState
                                      .tickets.value![index].answers[index]),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                backgroundColor: _getAnswerColor(
                                  userAnswer: examState
                                      .userAnswers[index].selectedAnswer,
                                  actualAnswer: examState
                                      .tickets.value![index].answers[index],
                                ),
                                foregroundColor: null,
                              ),
                              child: Text(
                                toBeginningOfSentenceCase(examState.tickets
                                    .value![index].answers[index].answer),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          // if (userAnswer.answer != null &&
                          //     userAnswer.answer == ticket.answers[index] &&
                          //     !(userAnswer.answer?.correct ?? false))
                          //   IgnorePointer(
                          //     child: Icon(
                          //       Icons.error_outline,
                          //       color: Colors.red.withOpacity(0.05),
                          //       size: 160 +
                          //           ticket.answers.fold(
                          //                 0,
                          //                 (previousValue, element) =>
                          //                     previousValue + element.answer.length,
                          //               ) /
                          //               ticket.answers.length,
                          //     ),
                          //   ),
                          // IgnorePointer(
                          //   child: Padding(
                          //     padding:
                          //         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          //     child: Align(
                          //       alignment: getQuestionNumberPosition(index),
                          //       child: Opacity(
                          //         opacity: 0.2,
                          //         child: Text(
                          //           '${index + 1}',
                          //           style: const TextStyle(
                          //             fontSize: 24,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        _QuestionIndexDotIndicatorsWidget(
          currentTicket:
              examState.tickets.value![examState.currentQuestionIndex],
          currentQuestionIndex: examState.currentQuestionIndex,
          examTickets: examState.tickets.value!,
          userAnswers: examState.userAnswers
              .map((e) => (
                    answer: e.selectedAnswer,
                    index: examState.currentQuestionIndex,
                    showExplanation: e.showExplanation,
                    ticket: e.ticket,
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
    );
  }

  Widget _buildNextButton(
      ExamState examState, ExamScreenController controller) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: DSSpacingTokens.xxl.all,
        child: FloatingActionButton(
          heroTag: 'exam-fab-next',
          onPressed: examState.currentQuestionIndex <
                  examState.tickets.value!.length - 1
              ? () =>
                  controller.goToQuestion(examState.currentQuestionIndex + 1)
              : null,
          child: Icon(Icons.keyboard_arrow_right, size: DSSizeTokens.l.value),
        ),
      ),
    );
  }

  Widget _buildExplanationButton(
      ExamState examState, ExamScreenController controller) {
    final currentAnswer = examState.userAnswers[examState.currentQuestionIndex];
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: DSSpacingTokens.xxl.all,
        child: AnimatedSwitcher(
          duration: DurationTokens.shortest,
          child: currentAnswer.selectedAnswer == null
              ? null
              : FloatingActionButton.extended(
                  heroTag: 'exam-fab-explanation',
                  onPressed: () => controller
                      .toggleExplanation(examState.currentQuestionIndex),
                  label: Text(currentAnswer.showExplanation
                      ? 'Hide Explanation'
                      : 'Show Explanation'),
                ),
        ),
      ),
    );
  }

  Widget _buildPreviousButton(
      ExamState examState, ExamScreenController controller) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: AnimatedSwitcher(
        duration: DurationTokens.shortest,
        child: examState.currentQuestionIndex == 0
            ? null
            : Padding(
                padding: DSSpacingTokens.xxl.all,
                child: FloatingActionButton(
                  heroTag: 'exam-fab-previous',
                  onPressed: () => controller
                      .goToQuestion(examState.currentQuestionIndex - 1),
                  child: Icon(Icons.chevron_left, size: DSSizeTokens.l.value),
                ),
              ),
      ),
    );
  }

  Alignment getQuestionNumberPosition(int index) {
    return index == 0
        ? Alignment.topLeft
        : index == 1
            ? Alignment.topRight
            : index == 2
                ? Alignment.bottomLeft
                : Alignment.bottomRight;
  }

  Color? _getAnswerColor({
    required AnswerDto? userAnswer,
    required AnswerDto actualAnswer,
  }) {
    if (userAnswer == null) {
      return null;
    }

    if (actualAnswer.correct) {
      // Mild green for correct answer
      return Colors.green.withOpacity(0.8);
    }

    if (!actualAnswer.correct && userAnswer.answer == actualAnswer.answer) {
      // Red for wrong selected answer
      return Colors.red.withOpacity(0.8);
    }

    // Grey for other answers
    return Colors.grey.withOpacity(0.8);
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
