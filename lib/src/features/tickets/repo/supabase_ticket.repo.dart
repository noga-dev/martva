import 'package:collection/collection.dart';
import 'package:martva/src/core/i18n/data/localization.repo.dart';
import 'package:martva/src/core/utils/messaging/logger.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const _selectTickets = '''
          id,
          ordinal_id,
          image_url,
          ticket_details!inner (
            question,
            explanation
          ),
          ticket_answers!inner (
            answer,
            is_correct,
            ordinal
          )
        ''';

class SupabaseTicketRepo implements TicketRepo {
  const SupabaseTicketRepo();

  @override
  Future<List<TicketDto>> getTickets({
    required SupportedLocale language,
    required TicketTranslation translation,
    required int limit,
    required bool sortByOrdinalId,
  }) async {
    final String actualTranslation = "${language.dbName}_${translation.dbName}";

    assert(actualTranslation != 'ge_gpt4o_mini', 'invalid translation');

    final queryBuilder =
        Supabase.instance.client.from('tickets').select(_selectTickets);

    final filterBuilder = queryBuilder
        .eq('ticket_details.translation', actualTranslation)
        .eq('ticket_answers.translation', actualTranslation);

    final orderBuilder = sortByOrdinalId
        ? filterBuilder.order(
            'ordinal_id',
            ascending: true,
          )
        : filterBuilder;

    final limitBuilder = orderBuilder.limit(limit);

    try {
      final response = await limitBuilder;

      if (response.isEmpty) {
        logger.t('No tickets found for translation: $actualTranslation');

        return [];
      }

      final parsed = response.map(_extractTicket).toList();

      // talker.verbose(response.first);

      return parsed;
    } catch (e) {
      logger.e(
        'Error fetching tickets: $e',
        time: DateTime.now(),
        error: e,
        stackTrace: StackTrace.current,
      );

      rethrow;

      // return [];
    }
  }

  @override
  Future<List<TicketDto>> getTicketsById({
    required List<String> ids,
    required SupportedLocale language,
    required TicketTranslation translation,
  }) async {
    final String actualTranslation = "${language.dbName}_${translation.dbName}";

    try {
      final queryBuilder = Supabase.instance.client
          .from('tickets')
          .select(_selectTickets)
          .eq('ticket_details.translation', actualTranslation)
          .eq('ticket_answers.translation', actualTranslation)
          .or('id.in.(${ids.join(',')})');

      final response = await queryBuilder;

      if (response.isEmpty) {
        logger.t('No tickets found for translation: $actualTranslation');

        return [];
      }

      final parsed = response.map(_extractTicket).toList();

      // talker.verbose(response.first);

      return parsed;
    } catch (e) {
      logger.e(
        'Error fetching tickets: $e',
        time: DateTime.now(),
        error: e,
        stackTrace: StackTrace.current,
      );

      return [];
    }
  }

  @override
  Future<List<String>> getRandomizedTicketIds() async {
    final ticketIds =
        await Supabase.instance.client.from('tickets').select('id');

    // randomize
    ticketIds.shuffle();

    // final limitIds = getTicketIds.take(Constants.examTicketsLimit);

    final parsedIds = ticketIds.map((e) => e['id'].toString()).toList();

    return parsedIds;
  }

  @override
  Future<List<TicketDto>> getExamTickets({
    required SupportedLocale language,
    required TicketTranslation translation,
    required List<String> ticketIds,
  }) async {
    // sadly no ez way to do this on backend

    final examTickets = await getTicketsById(
      ids: ticketIds,
      language: language,
      translation: translation,
    );

    return examTickets;
  }
}

TicketDto _extractTicket(json) {
  return TicketDto(
    id: json['id'],
    ordinalId: json['ordinal_id'],
    question: json['ticket_details'][0]['question'],
    explanation: json['ticket_details'][0]['explanation'],
    image: json['image_url'],
    answers: (json['ticket_answers'] as List)
        .map((answer) => AnswerDto(
              answer: answer['answer'],
              correct: answer['is_correct'],
              ordinal: answer['ordinal'],
            ))
        .sortedBy<num>((a) => a.ordinal)
        .toList(),
  );
}
