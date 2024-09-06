import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/theme/view/tokens/ds_spacing_tokens.dart';
import 'package:martva/src/core/utils/extensions/list.dart';
import 'package:martva/src/core/utils/messaging/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DbSeederScreen extends ConsumerWidget {
  const DbSeederScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // ElevatedButton(
          //   onPressed: () async {
          //     final data =
          //         await rootBundle.loadString(Assets.i18n.tickets.geTeoriaonge);
          //     final List<dynamic> list = json.decode(data);

          //     // Process and insert data
          //     await processData(
          //         Supabase.instance.client, 'ge_teoria.on.ge', list);

          //     logger.d('Data seeding completed.');
          //   },
          //   child: const Text('Seed ge_teoria.on.ge'),
          // ),
          // ElevatedButton(
          //   onPressed: () async {
          //     final data =
          //         await rootBundle.loadString(Assets.i18n.tickets.enTeoriaonge);
          //     final List<dynamic> list = json.decode(data);

          //     // Process and insert data
          //     await processData(
          //         Supabase.instance.client, 'en_teoria.on.ge', list);

          //     logger.d('Data seeding completed.');
          //   },
          //   child: const Text('Seed en_teoria.on.ge'),
          // ),
          // ElevatedButton(
          //   onPressed: () async {
          //     final data =
          //         await rootBundle.loadString(Assets.i18n.tickets.ruTeoriaonge);
          //     final List<dynamic> list = json.decode(data);

          //     // Process and insert data
          //     await processData(
          //         Supabase.instance.client, 'ru_teoria.on.ge', list);

          //     logger.d('Data seeding completed.');
          //   },
          //   child: const Text('Seed ru_teoria.on.ge'),
          // ),
          // ElevatedButton(
          //   onPressed: () async {
          //     final data =
          //         await rootBundle.loadString(Assets.i18n.tickets.enGpt4omini);
          //     final List<dynamic> list = json.decode(data);

          //     // Process and insert data
          //     await processData(
          //       Supabase.instance.client,
          //       'en_GPT-4o-mini',
          //       list,
          //     );

          //     logger.d('Data seeding completed.');
          //   },
          //   child: const Text('Seed en_GPT-4o-mini'),
          // ),
          // ElevatedButton(
          //   onPressed: () async {
          //     final data =
          //         await rootBundle.loadString(Assets.i18n.tickets.ruGpt4omini);
          //     final List<dynamic> list = json.decode(data);

          //     // Process and insert data
          //     await processData(
          //         Supabase.instance.client, 'ru_GPT-4o-mini', list);

          //     logger.d('Data seeding completed.');
          //   },
          //   child: const Text('Seed ru_GPT-4o-mini'),
          // ),
        ].intersperse(DSSpacingTokens.m.verticalBox).toList(),
      ),
    );
  }
}

Future<void> processData(
  SupabaseClient supabase,
  String language,
  List<dynamic> data,
) async {
  for (final item in data) {
    try {
      // Upsert ticket
      final ticketId = await upsertTicket(
        supabase,
        item?['image'] ?? '',
        item['id'],
      );

      // Upsert ticket translation
      await upsertTicketTranslation(
        supabase,
        ticketId,
        language,
        item['question'],
        item?['explanation'] ?? '',
      );

      // Upsert ticket answers
      await upsertTicketAnswers(
        supabase,
        ticketId,
        language,
        item['answers'],
      );

      logger.t('Processed ticket ${item['id']} for language $language');
    } catch (e) {
      logger.e(
        'Error processing ticket ${item['id']} for language $language: $e',
        time: DateTime.now(),
        error: e,
        stackTrace: StackTrace.current,
      );
    }

    // if (item['id'] == 1) {
    //   break;
    // }
  }
}

Future<String> upsertTicket(
  SupabaseClient supabase,
  String imageUrl,
  int ordinalId,
) async {
  final existingTicket = await supabase
      .from('tickets')
      .select()
      .eq('ordinal_id', ordinalId)
      .maybeSingle();

  if (existingTicket != null && existingTicket['image_url'] == imageUrl) {
    return existingTicket['id'];
  }

  final response = await supabase
      .from('tickets')
      .upsert(
        {'image_url': imageUrl, 'ordinal_id': ordinalId},
      )
      .select()
      .single();

  return response['id'];
}

Future<void> upsertTicketTranslation(
  SupabaseClient supabase,
  String ticketId,
  String translation,
  String question,
  String explanation,
) async {
  final existingTranslation = await supabase
      .from('ticket_details')
      .select()
      .eq('ticket_id', ticketId)
      .eq('translation', translation)
      .maybeSingle();

  if (existingTranslation != null &&
      existingTranslation['question'] == question &&
      existingTranslation['explanation'] == explanation) {
    logger.t(
        'Translation already exists for ticket $ticketId and translation $translation');
    return;
  }

  await supabase.from('ticket_details').upsert(
    {
      'ticket_id': ticketId,
      'translation': translation,
      'question': question,
      'explanation': explanation,
    },
  );
}

Future<void> upsertTicketAnswers(
  SupabaseClient supabase,
  String ticketId,
  String translation,
  List<dynamic> answers,
) async {
  final existingAnswers = await supabase
      .from('ticket_answers')
      .select()
      .eq('ticket_id', ticketId)
      .eq('translation', translation);

  for (var i = 0; i < answers.length; i++) {
    final newAnswer = {
      'ticket_id': ticketId,
      'translation': translation,
      'answer': answers[i]['answer'],
      'is_correct': answers[i]['correct'] ?? false,
      'ordinal': i,
    };

    final existingAnswer = existingAnswers.where(
      (answer) =>
          answer['ordinal'] == i && answer['translation'] == translation,
    );

    if (existingAnswer.isNotEmpty &&
        existingAnswer.first['answer'] == newAnswer['answer'] &&
        existingAnswer.first['is_correct'] == newAnswer['is_correct']) {
      logger.t(
          'Answer $i already exists for ticket $ticketId and translation $translation');
      continue;
    }

    await supabase.from('ticket_answers').upsert(
          newAnswer,
        );
  }
}
