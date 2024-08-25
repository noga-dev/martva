import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/features/presentation/ticket_details_screen.dart';
import 'package:martva/src/repos/ticket.repo.dart';
import 'package:martva/src/services/spaced_repetition_service.dart';

class TicketsScreen extends HookConsumerWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketsAsyncValue = ref.watch(ticketRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets to Review'),
      ),
      body: ticketsAsyncValue.when(
        data: (tickets) {
          final dueItems = ref
              .watch(spacedRepetitionServiceProvider(tickets).notifier)
              .getDueItems();

          return ListView.builder(
            itemCount: dueItems.length,
            itemBuilder: (context, index) =>
                TicketListItem(item: dueItems[index]),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class TicketListItem extends StatelessWidget {
  final SpacedRepetitionItem item;

  const TicketListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.ticket.question),
      subtitle:
          Text('Next review: ${item.nextReviewDate.toString().split(' ')[0]}'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TicketDetailScreen(item: item),
          ),
        );
      },
    );
  }
}
