import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:martva/src/core/utils/messaging/logger.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseTicketRepo implements TicketRepo {
  const SupabaseTicketRepo();

  @override
  Future<List<TicketDto>> select({
    required Locale language,
    required TicketTranslation translation,
  }) async {
    final String actualTranslation =
        "${language.languageCode}_${translation.dbName}";

    try {
      final response = await Supabase.instance.client
          .from('tickets')
          .select('''
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
        ''')
          .eq('ticket_details.translation', actualTranslation)
          .eq('ticket_answers.translation', actualTranslation)
          .limit(3)
          .order('ordinal_id', ascending: true);

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
  Future<List<TicketDto>> getTicketsById({
    required List<String> ids,
    required Locale language,
    required TicketTranslation translation,
  }) async {
    final String actualTranslation =
        "${language.languageCode}_${translation.dbName}";

    try {
      final response = await Supabase.instance.client
          .from('tickets')
          .select('''
          id,
          ordinal_id,
          image_url,
          ticket_details!inner (
            question,
            explanation
          ),
          ticket_answers!inner (
            answer,
            is_correct
          )
        ''')
          .eq('ticket_details.translation', actualTranslation)
          .eq('ticket_answers.translation', actualTranslation)
          .or('id.in.(${ids.join(',')})')
          .order('ordinal_id', ascending: true);

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
