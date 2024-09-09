import 'package:collection/collection.dart';
import 'package:martva/src/core/i18n/data/localization.repo.dart';
import 'package:martva/src/core/utils/constants.dart';
import 'package:martva/src/core/utils/enums/license_category.dart';
import 'package:martva/src/core/utils/enums/question_category.dart';
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
      TicketTranslation.original => 'original',
      TicketTranslation.gpt4oMini => 'Martva',
    };
  }
}

abstract class TicketRepo {
  Future<List<TicketDto>> getTickets({
    required int limit,
    required int offset,
  });

  Future<List<TicketDto>> getExamTickets({
    required SupportedLocale language,
    required TicketTranslation translation,
    required List<String> ticketIds,
  });

  Future<List<String>> getRandomizedTicketIds();
  // Future<int> getTotalTicketsCount();

  Future<List<TicketDto>> getTicketsById({
    required List<String> ids,
    required SupportedLocale language,
    required TicketTranslation translation,
  });

  FutureOr<
      ({
        List<TicketDto> tickets,
        int totalCount,
      })> getTicketsByOrdinal({
    required List<int> ordinals,
    required SupportedLocale language,
    required TicketTranslation translation,
    required int from,
    required int to,
  });

  Future<void> setUserAnswer({
    required String ticketId,
    required String answerId,
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

@Riverpod(dependencies: [
  LocalizationRepo,
  TicketTranslationNotifer,
])
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

@Riverpod(dependencies: [
  LocalizationRepo,
  TicketTranslationNotifer,
])
Future<List<TicketDto>> getTicketsById(
  GetTicketsByIdRef ref, {
  required List<String> ids,
}) async {
  final localizationRepo = ref.watch(localizationRepoProvider);
  final translation = ref.watch(ticketTranslationNotiferProvider);
  final ticketRepo = ref.watch(ticketRepoProvider);

  return ticketRepo.getTicketsById(
    ids: ids,
    language: localizationRepo,
    translation: translation,
  );
}

@Riverpod(dependencies: [
  LocalizationRepo,
  TicketTranslationNotifer,
])
Future<TicketDto> getTicketById(
  GetTicketByIdRef ref, {
  required String id,
}) async {
  final localizationRepo = ref.watch(localizationRepoProvider);
  final translation = ref.watch(ticketTranslationNotiferProvider);
  final ticketRepo = ref.watch(ticketRepoProvider);

  final tickets = await ticketRepo.getTicketsById(
    ids: [id],
    language: localizationRepo,
    translation: translation,
  );

  return tickets.first;
}

// get by ordinal
@Riverpod(dependencies: [
  LocalizationRepo,
  TicketTranslationNotifer,
])
Future<TicketDto> getTicketByOrdinal(
  GetTicketByOrdinalRef ref, {
  required int ordinal,
}) async {
  final localizationRepo = ref.watch(localizationRepoProvider);
  final translation = ref.watch(ticketTranslationNotiferProvider);
  final ticketRepo = ref.watch(ticketRepoProvider);

  final result = await ticketRepo.getTicketsByOrdinal(
    ordinals: [ordinal],
    language: localizationRepo,
    translation: translation,
    from: 0,
    to: 1,
  );

  return result.tickets.first;
}

// @Riverpod(dependencies: [
//   LocalizationRepo,
//   TicketTranslationNotifer,
// ])
// Future<List<TicketDto>> getTickets(GetTicketsRef ref) async {
//   final localizationRepo = ref.watch(localizationRepoProvider);
//   final translation = ref.watch(ticketTranslationNotiferProvider);
//   final ticketRepo = ref.watch(ticketRepoProvider);

//   return ticketRepo.getTickets(
//     limit: 30,
//     language: localizationRepo,
//     translation: translation,
//     sortByOrdinalId: true,
//   );
// }

@riverpod
class LicenseCategoryNotifier extends _$LicenseCategoryNotifier {
  @override
  LicenseCategory build() {
    return LicenseCategory.all;
  }

  void update(LicenseCategory category) {
    state = category;
  }
}

@riverpod
class QuestionCategoryNotifier extends _$QuestionCategoryNotifier {
  @override
  QuestionCategory build() {
    return QuestionCategory.all;
  }

  void update(QuestionCategory category) {
    state = category;
  }
}

@Riverpod(dependencies: [
  LocalizationRepo,
  TicketTranslationNotifer,
])
FutureOr<
    ({
      List<TicketDto> tickets,
      int totalCount,
    })> filteredTickets(
  FilteredTicketsRef ref, {
  required int limit,
  required int offset,
}) async {
  final licenseCategory = ref.watch(licenseCategoryNotifierProvider);
  final questionCategory = ref.watch(questionCategoryNotifierProvider);
  final locale = ref.watch(localizationRepoProvider);
  final translation = ref.watch(ticketTranslationNotiferProvider);

  final licenseOrdinals = licenseCategory.tickets;
  final questionOrdinals = questionCategory.tickets;

  // final combinedOrdinals = {...licenseOrdinals, ...questionOrdinals}.toList();

  final commonOrdinals =
      licenseOrdinals.toSet().intersection(questionOrdinals.toSet()).toList();

  final results = await ref.watch(ticketRepoProvider).getTicketsByOrdinal(
        ordinals: commonOrdinals,
        language: locale,
        translation: translation,
        from: offset,
        to: offset + limit - 1,
      );

  return results;
}

@riverpod
Future<List<int>> filteredTicketOrdinals(FilteredTicketOrdinalsRef ref) async {
  final licenseCategory = ref.watch(licenseCategoryNotifierProvider);
  final questionCategory = ref.watch(questionCategoryNotifierProvider);

  final licenseOrdinals = licenseCategory.tickets;
  final questionOrdinals = questionCategory.tickets;

  // final combinedOrdinals = {...licenseOrdinals, ...questionOrdinals}.toList();

  final commonOrdinals =
      licenseOrdinals.toSet().intersection(questionOrdinals.toSet()).toList();

  final sorted = commonOrdinals.sortedBy<num>((e) => e);

  return sorted;
}
