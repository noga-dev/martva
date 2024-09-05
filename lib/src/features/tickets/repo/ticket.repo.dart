import 'package:flutter/material.dart';
import 'package:martva/src/core/i18n/data/localization.repo.dart';
import 'package:martva/src/core/utils/constants.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/supabase_ticket.repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket.repo.g.dart';

enum TicketTranslation {
  original,
  gpt4oMini;

  String get dbName {
    return switch (this) {
      TicketTranslation.original => 'teoria.on.ge',
      TicketTranslation.gpt4oMini => 'GPT-4o-mini',
    };
  }

  String get name {
    return switch (this) {
      TicketTranslation.original => 'teoria.on.ge',
      TicketTranslation.gpt4oMini => 'Martva',
    };
  }
}

abstract class TicketRepo {
  Future<List<TicketDto>> getTickets({
    required int limit,
    required Locale language,
    required TicketTranslation translation,
    required bool sortByOrdinalId,
  });

  Future<List<TicketDto>> getExamTickets({
    required Locale language,
    required TicketTranslation translation,
    required List<String> ticketIds,
  });

  Future<List<String>> getRandomizedTicketIds();

  Future<List<TicketDto>> getTicketsById({
    required List<String> ids,
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
class TicketTranslationNotifer extends _$TicketTranslationNotifer {
  @override
  TicketTranslation build() {
    return TicketTranslation.original;
  }

  void update(TicketTranslation translation) {
    state = translation;
  }
}

@riverpod
Future<List<String>> getRandomTicketIds(GetRandomTicketIdsRef ref) async {
  final ticketRepo = ref.watch(ticketRepoProvider);

  return ticketRepo.getRandomizedTicketIds();
}

@riverpod
Future<List<TicketDto>> getExamTickets(GetExamTicketsRef ref) async {
  final localizationRepo = ref.watch(localizationRepoProvider);
  final translation = ref.watch(ticketTranslationNotiferProvider);
  final ticketRepo = ref.watch(ticketRepoProvider);
  final randomTicketIds = await ref.watch(getRandomTicketIdsProvider.future);

  final limit = randomTicketIds.take(Constants.examTicketsLimit).toList();

  return ticketRepo.getExamTickets(
    language: localizationRepo,
    translation: translation,
    ticketIds: limit,
  );
}

@riverpod
Future<List<TicketDto>> getTickets(GetTicketsRef ref) async {
  final localizationRepo = ref.watch(localizationRepoProvider);
  final translation = ref.watch(ticketTranslationNotiferProvider);
  final ticketRepo = ref.watch(ticketRepoProvider);

  return ticketRepo.getTickets(
    limit: 30,
    language: localizationRepo,
    translation: translation,
    sortByOrdinalId: true,
  );
}
