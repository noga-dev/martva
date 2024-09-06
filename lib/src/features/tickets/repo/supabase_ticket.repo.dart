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

  @override
  Future<void> setUserAnswer({
    required String ticketId,
    required String answerId,
  }) async {
    await Supabase.instance.client.from('user_answers').insert({
      'ticket_id': ticketId,
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
          totalCount: 0,
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
