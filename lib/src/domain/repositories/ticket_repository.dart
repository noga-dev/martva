// File: lib/data/repositories/ticket_repository.dart
import 'dart:convert';

import 'package:martva/gen/assets.gen.dart';
import 'package:martva/src/data/models/ticket.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_repository.g.dart';

class TicketRepository {
  List<TicketDto> getTickets() {
    return (jsonDecode(Assets.langs.ticketsGeTeoriaonge)
            as List<Map<String, dynamic>>)
        .map((json) => TicketDto.fromJson(json))
        .toList();
  }

  TicketDto? getTicketById(int id) {
    final ticketJson = getTickets().firstWhere(
      (ticket) => ticket.id == id,
    );

    return ticketJson;
  }
}

@riverpod
TicketRepository ticketRepository(TicketRepositoryRef ref) {
  return TicketRepository();
}
