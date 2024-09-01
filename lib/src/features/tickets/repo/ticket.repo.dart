import 'package:flutter/material.dart';
import 'package:martva/src/core/i18n/data/localization.repo.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/supabase_ticket.repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket.repo.g.dart';

enum TicketTranslation {
  original,
  gpt4oMini;

  String get name {
    return switch (this) {
      TicketTranslation.original => 'teoria.on.ge',
      TicketTranslation.gpt4oMini => 'gpt-4o-mini',
    };
  }
}

abstract class TicketRepo {
  Future<List<TicketDto>> select({
    required Locale language,
    required TicketTranslation translation,
  });
}

@Riverpod(keepAlive: true)
TicketRepo ticketRepo(TicketRepoRef ref) {
  return const SupabaseTicketRepo();
}

@Riverpod(
  keepAlive: true,
  dependencies: [],
)
TicketTranslation getTicketTranslation(GetTicketTranslationRef ref) {
  return TicketTranslation.original;
}

@riverpod
Future<List<TicketDto>> getTickets(GetTicketsRef ref) async {
  final localizationRepo = ref.watch(localizationRepoProvider);
  final translation = ref.watch(getTicketTranslationProvider);

  final ticketRepo = ref.watch(ticketRepoProvider);

  return ticketRepo.select(
    language: localizationRepo,
    translation: translation,
  );
}
