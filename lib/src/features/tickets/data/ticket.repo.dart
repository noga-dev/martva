import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:martva/gen/assets.gen.dart';
import 'package:martva/src/features/tickets/context/ticket.dto.dart';
import 'package:martva/src/features/tickets/data/ticket_translation.repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket.repo.g.dart';

@riverpod
class TicketRepo extends _$TicketRepo {
  @override
  Future<List<TicketDto>> build() async {
    final ticketTranslation = ref.watch(ticketTranslationRepoProvider);

    final String jsonString =
        await rootBundle.loadString(switch (ticketTranslation) {
      TicketTranslation.ruGpt4oMini => Assets.i18n.tickets.ruGpt4omini,
      TicketTranslation.enGpt4oMini => Assets.i18n.tickets.enGpt4omini,
      TicketTranslation.geOriginal => Assets.i18n.tickets.geTeoriaonge,
      TicketTranslation.ruOriginal => Assets.i18n.tickets.ruTeoriaonge,
      TicketTranslation.enOriginal => Assets.i18n.tickets.enTeoriaonge,
      // ignore: unreachable_switch_case
      _ => Assets.i18n.tickets.enGpt4omini,
    });

    final List<dynamic> jsonList = json.decode(jsonString);

    return jsonList.map((json) => TicketDto.fromJson(json)).toList();
  }
}
