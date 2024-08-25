// File: lib/features/tickets/presentation/widgets/ticket_card.dart
import 'package:flutter/material.dart';
import 'package:martva/src/data/models/ticket.dto.dart';

class TicketCard extends StatelessWidget {
  final TicketDto ticket;
  final Function(bool) onAnswered;

  const TicketCard({
    super.key,
    required this.ticket,
    required this.onAnswered,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (ticket.image != null)
              Image.asset(
                ticket.image!,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            const SizedBox(height: 16),
            Text(
              ticket.question,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...ticket.answers.map(
              (answer) => ElevatedButton(
                onPressed: () => onAnswered(answer.correct),
                child: Text(answer.answer),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
