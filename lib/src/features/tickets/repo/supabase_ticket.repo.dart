import 'dart:async';

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
            id,
            answer,
            is_correct,
            ordinal
          )
        ''';

class SupabaseTicketRepo implements TicketRepo {
  const SupabaseTicketRepo();

  @override
  Future<List<TicketDto>> getFlashcardTickets({
    required SupportedLocale language,
    required TicketTranslation translation,
    int? limit,
    int? offset,
  }) async {
    final query =
        Supabase.instance.client.from('tickets').select(_selectTickets);

    final String actualTranslation = "${language.dbName}_${translation.dbName}";

    final filterBuilder = query
        .eq('ticket_details.translation', actualTranslation)
        .eq('ticket_answers.translation', actualTranslation);

    final limitBuilder = filterBuilder.limit(limit ?? 10);

    final rangeBuilder =
        limitBuilder.range(offset ?? 0, offset! + (limit ?? 10) - 1);

    final response = await rangeBuilder;

    return response.map(_extractTicket).toList();
  }

  @override
  Future<List<TicketDto>> getTicketsById({
    required List<String> ids,
    required SupportedLocale language,
    required TicketTranslation translation,
  }) async {
    if (ids.isEmpty) {
      return [];
    }

    if (!ids.any((element) => RegExp(
          r'^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
          caseSensitive: false,
        ).hasMatch(element))) {
      logger.e('Invalid ticket id: $ids');
      return [];
    }

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

  @override
  Future<void> setUserAnswer({
    required String ticketId,
    required String answerId,
  }) async {
    await Supabase.instance.client.from('user_answers').insert({
      'answer_id': answerId,
    });
  }

  // @override
  // Future<int> getTotalTicketsCount() async {
  //   final response =
  //       await Supabase.instance.client.from('tickets').select('id').count();

  //   return response.count;
  // }

  @override
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
  }) async {
    final String actualTranslation = "${language.dbName}_${translation.dbName}";

    try {
      final queryBuilder = Supabase.instance.client
          .from('tickets')
          .select(_selectTickets)
          .eq('ticket_details.translation', actualTranslation)
          .eq('ticket_answers.translation', actualTranslation)
          .or('ordinal_id.in.(${ordinals.join(',')})')
          .order('ordinal_id', ascending: true)
          .range(from, to)
          .count();

      final response = await queryBuilder;

      if (response.data.isEmpty) {
        logger.t('No tickets found for translation: $actualTranslation');

        return (
          tickets: <TicketDto>[],
          totalCount: response.count,
        );
      }

      final parsed = response.data.map(_extractTicket).toList();

      return Future.value((
        tickets: parsed,
        totalCount: response.count,
      ));
    } catch (e) {
      logger.e(
        'Error fetching tickets: $e',
        time: DateTime.now(),
        error: e,
        stackTrace: StackTrace.current,
      );

      return Future.value((
        tickets: <TicketDto>[],
        totalCount: 0,
      ));
    }
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
              id: answer['id'],
              answer: answer['answer'],
              correct: answer['is_correct'],
              ordinal: answer['ordinal'],
            ))
        .sortedBy<num>((a) => a.ordinal)
        .toList(),
  );
}
