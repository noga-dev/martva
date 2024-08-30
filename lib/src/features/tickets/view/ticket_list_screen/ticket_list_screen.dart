import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/features/review/context/spaced_repetition_service.dart';
import 'package:martva/src/features/tickets/context/ticket.dto.dart';
import 'package:martva/src/features/tickets/data/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/ticket_details_screen/ticket_details_screen.dart';

class TicketsScreen extends HookConsumerWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketsAsyncValue = ref.watch(ticketRepoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets to Review'),
      ),
      body: ticketsAsyncValue.when(
        data: (tickets) {
          return ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) =>
                TicketListItem(ticket: tickets[index]),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class TicketListItem extends HookConsumerWidget {
  const TicketListItem({
    super.key,
    required this.ticket,
  });

  final TicketDto ticket;

  @override
  Widget build(BuildContext context, ref) {
    final dueItem =
        ref.watch(spacedRepetitionServiceProvider.notifier).getDueItem(ticket);

    return ListTile(
      leading: Text(ticket.id),
      title: Text(ticket.question),
      trailing: Text(
          'Next review:\n${dueItem.nextReviewDate.toString().split(' ')[0]}'),
      subtitle: const Wrap(
        children: [
          _Tag.one(),
          _Tag.two(),
          _Tag.three(),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TicketDetailScreen(item: dueItem),
          ),
        );
      },
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag.one() : color = Colors.red;
  const _Tag.two() : color = Colors.blue;
  const _Tag.three() : color = Colors.green;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Chip(
      // labelPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      label: const Text('test'),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      backgroundColor: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
