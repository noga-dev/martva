import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      children: [
        if (ticket.image.isNotEmpty) ...[
          Center(
            child: TicketImageMolecule(
              ticket: ticket,
            ),
          ),
          const SizedBox(height: 8),
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
                AnimatedCrossFade(
                  duration: Durations.medium2,
                  crossFadeState: userAnswer.showExplanation
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  secondChild: const SizedBox.shrink(),
                  firstChild: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          ticket.explanation,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
        const SizedBox(height: 12),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width < 801 ? 2 : 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 100 +
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
                ElevatedButton(
                  onPressed: userAnswer.answer == null
                      ? () => onAnswerSelected(ticket, ticket.answers[index])
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8),
                    shape: const BeveledRectangleBorder(),
                    disabledBackgroundColor: _getAnswerColor(
                      userAnswer: userAnswer.answer,
                      actualAnswer: ticket.answers[index],
                    ),
                    foregroundColor: null,
                  ),
                  child: Text(
                    toBeginningOfSentenceCase(ticket.answers[index].answer),
                    textAlign: TextAlign.center,
                  ),
                ),
                IgnorePointer(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text('${index + 1}'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Color? _getAnswerColor({
    required AnswerDto? userAnswer,
    required AnswerDto actualAnswer,
  }) {
    if (userAnswer == null) {
      return Colors.grey.withOpacity(0.2);
    }

    if (actualAnswer.correct) {
      // Mild green for correct answer
      return Colors.green.withOpacity(0.4);
    }

    if (!actualAnswer.correct && userAnswer.answer == actualAnswer.answer) {
      // Red for wrong selected answer
      return Colors.red.withOpacity(0.4);
    }
    // Grey for other answers
    return Colors.grey.withOpacity(0.2);
  }
}
