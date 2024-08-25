import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/repos/ticket.repo.dart';
import 'package:martva/src/services/progress_service.dart';
import 'package:martva/src/services/spaced_repetition_service.dart';

class TicketDetailScreen extends HookConsumerWidget {
  final SpacedRepetitionItem item;

  const TicketDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressService = ref.watch(progressServiceProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket ${item.ticket.id}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.ticket.question,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              if (item.ticket.image != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CachedNetworkImage(
                    imageUrl: item.ticket.image!,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              const SizedBox(height: 16),
              ...item.ticket.answers.map(
                (answer) => ElevatedButton(
                  onPressed: () async {
                    final grade = answer.correct ? 5 : 1;
                    final ticketsAsyncValue =
                        await ref.watch(ticketRepositoryProvider.future);

                    final spacedRepetitionService = ref.watch(
                        spacedRepetitionServiceProvider(ticketsAsyncValue)
                            .notifier);
                    spacedRepetitionService.updateItemGrade(
                        item.ticket.id, grade);
                    await progressService.updateProgress(
                        item.ticket.id, answer.correct);
                    _showResultDialog(
                        context, answer.correct, item.ticket.explanation);
                  },
                  child: Text(answer.answer),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showResultDialog(
      BuildContext context, bool isCorrect, String explanation) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isCorrect ? 'Correct!' : 'Incorrect'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(explanation),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
