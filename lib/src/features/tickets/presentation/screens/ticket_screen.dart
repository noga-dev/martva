// File: lib/features/tickets/presentation/screens/ticket_solving_screen.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/data/models/ticket.dto.dart';

import '../../../../domain/services/spaced_repetition_service.dart';
import '../widgets/ticket_card.dart';

class TicketSolvingScreen extends ConsumerStatefulWidget {
  const TicketSolvingScreen({super.key});

  @override
  ConsumerState<TicketSolvingScreen> createState() =>
      _TicketSolvingScreenState();
}

class _TicketSolvingScreenState extends ConsumerState<TicketSolvingScreen> {
  late Future<List<TicketDto>> _ticketsFuture;

  @override
  void initState() {
    super.initState();
    _ticketsFuture = _loadTickets();
  }

  Future<List<TicketDto>> _loadTickets() async {
    final spacedRepetitionService = ref.read(spacedRepetitionServiceProvider);
    // TODO: Replace with actual user ID
    return spacedRepetitionService.getNextTickets('user123', 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Solve Tickets')),
      body: FutureBuilder<List<TicketDto>>(
        future: _ticketsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No tickets available'));
          }

          return PageView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return TicketCard(
                ticket: snapshot.data![index],
                onAnswered: (correct) async {
                  final spacedRepetitionService =
                      ref.read(spacedRepetitionServiceProvider);
                  // TODO: Replace with actual user ID
                  await spacedRepetitionService.updateTicketScore(
                      'user123', snapshot.data![index].id.toString(), correct);
                },
              );
            },
          );
        },
      ),
    );
  }
}
