import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:martva/gen/assets.gen.dart';
import 'package:martva/src/models/ticket.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket.repo.g.dart';

@riverpod
class TicketRepository extends _$TicketRepository {
  @override
  Future<List<TicketDto>> build() async {
    return _loadTickets();
  }

  Future<List<TicketDto>> _loadTickets() async {
    final String jsonString =
        await rootBundle.loadString(Assets.langs.ticketsGeTeoriaonge);
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => TicketDto.fromJson(json)).toList();
  }
}
