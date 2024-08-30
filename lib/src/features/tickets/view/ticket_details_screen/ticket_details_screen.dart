import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/ticket_card_organism.dart';

class TicketDetailScreen extends HookConsumerWidget {
  const TicketDetailScreen({
    super.key,
    required this.ticketId,
  });

  final String ticketId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickets = ref.watch(ticketRepoProvider).valueOrNull ?? [];
    final ticket = tickets.firstWhere((element) => element.id == ticketId);
    final answer = useState<AnswerDto?>(null);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket ${ticket.id}'),
      ),
      body: TicketCardOrganism(
        ticket: ticket,
        onAnswerSelected: (ticket, answered) {
          answer.value = answered;
        },
        userAnswer: (
          answer: answer.value,
          index: 0,
          showExplanation: !(answer.value?.correct ?? true),
          ticket: ticket,
        ),
      ),
      // SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           item.ticket.question,
      //           style: Theme.of(context).textTheme.bodyLarge,
      //         ),
      //         if (item.ticket.image.isNotEmpty)
      //           Padding(
      //             padding: const EdgeInsets.symmetric(vertical: 16.0),
      //             child: TicketImageMolecule(
      //               ticket: item.ticket,
      //             ),
      //           ),
      //         const SizedBox(height: 16),
      //         ...item.ticket.answers.map(
      //           (answer) => ElevatedButton(
      //             onPressed: () async {
      //               final grade = answer.correct ? 5 : 1;

      //               final spacedRepetitionService =
      //                   ref.watch(spacedRepetitionServiceProvider.notifier);

      //               spacedRepetitionService.updateItemGrade(
      //                   item.ticket.id, grade);

      //               await progressService.updateProgress(
      //                   item.ticket.id, answer.correct);

      //               if (!context.mounted) {
      //                 return;
      //               }

      //               showDialog(
      //                 context: context,
      //                 builder: (BuildContext context) {
      //                   return AlertDialog(
      //                     title:
      //                         Text(answer.correct ? 'Correct!' : 'Incorrect'),
      //                     content: SingleChildScrollView(
      //                       child: ListBody(
      //                         children: <Widget>[
      //                           Text(item.ticket.explanation),
      //                         ],
      //                       ),
      //                     ),
      //                     actions: <Widget>[
      //                       TextButton(
      //                         child: const Text('OK'),
      //                         onPressed: () {
      //                           Navigator.of(context).pop();
      //                           Navigator.of(context).pop();
      //                         },
      //                       ),
      //                     ],
      //                   );
      //                 },
      //               );
      //             },
      //             child: Text(answer.answer),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
