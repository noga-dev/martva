// srs_screen.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:martva/src/features/srs/application/srs_notifier.dart';
import 'package:martva/src/features/srs/domain/srs_item_dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';

class SrsScreen extends ConsumerWidget {
  const SrsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final srsState = ref.watch(srsNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('SRS Practice')),
      body: srsState.when(
        data: (state) {
          return Column(
            children: [
              _buildStatisticsCard(state.statistics),
              _buildNextDueItemsCard(state.nextDueItems),
              Expanded(
                child: state.dueTickets.isEmpty
                    ? const Center(child: Text('No items due for practice'))
                    : _buildDueItemsList(state.dueTickets, ref),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildStatisticsCard(Map<String, dynamic> statistics) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Statistics',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Total Items: ${statistics['totalItems']}'),
            Text('Due Items: ${statistics['dueItems']}'),
            Text('Total Attempts: ${statistics['totalAttempts']}'),
            Text('Correct Attempts: ${statistics['correctAttempts']}'),
            Text(
                'Accuracy: ${(statistics['correctAttempts'] / statistics['totalAttempts'] * 100).toStringAsFixed(2)}%'),
          ],
        ),
      ),
    );
  }

  Widget _buildNextDueItemsCard(List<SrsItemDto> nextDueItems) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Next Due Items',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...nextDueItems.map((item) => Text(
                  'Item ${item.ticketId.substring(0, 8)}: ${DateFormat('yyyy-MM-dd HH:mm').format(item.nextDueDate)}',
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildDueItemsList(List<TicketDto> dueTickets, WidgetRef ref) {
    return ListView.builder(
      itemCount: dueTickets.length,
      itemBuilder: (context, index) {
        final ticket = dueTickets[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Question ${index + 1}:',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(ticket.question),
                if (ticket.image.isNotEmpty) Image.network(ticket.image),
                const SizedBox(height: 16),
                ...ticket.answers.map((answer) => ElevatedButton(
                      child: Text(answer.answer),
                      onPressed: () {
                        ref
                            .read(srsNotifierProvider.notifier)
                            .answerQuestion(ticket.id, answer.id);
                      },
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
