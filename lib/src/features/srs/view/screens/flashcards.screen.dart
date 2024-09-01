// lib/presentation/screens/ticket_screen.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/features/srs/dto/flashcard.dto.dart';
import 'package:martva/src/features/srs/view/screens/flashcards.controller.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';

class FlashcardsScreen extends ConsumerWidget {
  const FlashcardsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcardsState = ref.watch(flashcardsControllerProvider);
    final ticketsState = ref.watch(getTicketsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Flashcards')),
      body: flashcardsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (flashcards) => ticketsState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('Error: $error')),
          data: (tickets) =>
              FlashcardList(flashcards: flashcards, tickets: tickets),
        ),
      ),
    );
  }
}

class FlashcardList extends ConsumerWidget {
  final List<FlashcardDto> flashcards;
  final List<TicketDto> tickets;

  const FlashcardList({
    super.key,
    required this.flashcards,
    required this.tickets,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: flashcards.length,
      itemBuilder: (context, index) {
        final flashcard = flashcards[index];
        final ticket = tickets.firstWhere((t) => t.id == flashcard.ticketId);
        return ListTile(
          title: Text(ticket.question),
          subtitle: Text('Last reviewed: ${flashcard.createdAt}'),
          onTap: () => _showFlashcardDialog(context, ref, flashcard, ticket),
        );
      },
    );
  }

  void _showFlashcardDialog(
    BuildContext context,
    WidgetRef ref,
    FlashcardDto flashcard,
    TicketDto ticket,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(ticket.question),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ticket.answers
              .map((answer) => ElevatedButton(
                    child: Text(answer.answer),
                    onPressed: () {
                      ref
                          .read(flashcardsControllerProvider.notifier)
                          .reviewFlashcard(
                            ticket: ticket,
                            answerIndex: ticket.answers.indexOf(answer),
                            flashcard: flashcard,
                          );
                      Navigator.of(context).pop();
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
