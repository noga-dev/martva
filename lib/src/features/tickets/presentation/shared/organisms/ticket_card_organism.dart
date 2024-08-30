import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:martva/src/core/design_system/presentation/tokens/ds_duration_tokens.dart';
import 'package:martva/src/core/design_system/presentation/tokens/ds_spacing_tokens.dart';
import 'package:martva/src/features/tickets/domain/ticket.dto.dart';
import 'package:martva/src/features/tickets/presentation/shared/molecules/ticket_image_molecule.dart';

class TicketCardOrganism extends StatelessWidget {
  final TicketDto ticket;
  final ({
    TicketDto ticket,
    int? index,
    AnswerDto? answer,
    bool showExplanation
  }) userAnswer;
  final Function(TicketDto, AnswerDto) onAnswerSelected;

  const TicketCardOrganism({
    super.key,
    required this.ticket,
    required this.userAnswer,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          // DSSpacingTokens.s.scaledVerticalSpace(10),
          if (ticket.image.isNotEmpty) ...[
            Center(
              child: TicketImageMolecule(
                ticket: ticket,
              ),
            ),
            DSSpacingTokens.m.verticalSpace,
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (ticket.image.isEmpty) const SizedBox(height: 12),
                Text(
                  ticket.question,
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
                    transitionBuilder: (child, animation) => SizeTransition(
                      axis: Axis.vertical,
                      sizeFactor: animation,
                      child: child,
                    ),
                    child: userAnswer.showExplanation
                        ? Center(
                            child: Card(
                              margin: EdgeInsets.zero,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              child: Padding(
                                padding: DSSpacingTokens.l.all,
                                child: Text(
                                  ticket.explanation,
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
          Expanded(
            child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width >= 800
                    ? ticket.answers.length == 3
                        ? 3
                        : 2
                    : 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 160 +
                    ticket.answers.fold(
                          0,
                          (previousValue, element) =>
                              previousValue + element.answer.length,
                        ) /
                        ticket.answers.length,
              ),
              children: List.generate(
                ticket.answers.length,
                (index) => Stack(
                  fit: StackFit.expand,
                  children: [
                    IgnorePointer(
                      ignoring: userAnswer.answer != null,
                      child: FilledButton(
                        onPressed: () =>
                            onAnswerSelected(ticket, ticket.answers[index]),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          backgroundColor: _getAnswerColor(
                            userAnswer: userAnswer.answer,
                            actualAnswer: ticket.answers[index],
                          ),
                          foregroundColor: null,
                        ),
                        child: Text(
                          toBeginningOfSentenceCase(
                              ticket.answers[index].answer),
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
          ),
        ],
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
