import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/theme/view/templates/async_value.widget.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/ticket_details_screen/ticket_details_screen.dart';

class TicketsScreen extends HookConsumerWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketsAsyncValue = ref.watch(getTicketsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets to Review'),
      ),
      body: AsyncValueWidget(
        value: ticketsAsyncValue,
        data: (tickets) => ListView.builder(
          itemCount: tickets.length,
          itemBuilder: (context, index) =>
              TicketListItem(ticket: tickets[index]),
        ),
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
    return ListTile(
      leading: Text(ticket.ordinalId.toString()),
      title: Text(ticket.question),
      trailing: const Text(
        // 'Next review:\n${dueItem.nextReviewDate.toString().split(' ')[0]}',
        'sdasd',
      ),
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
            builder: (context) => TicketDetailScreen(ticketId: ticket.id),
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
