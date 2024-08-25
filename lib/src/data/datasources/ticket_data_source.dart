// File: lib/data/datasources/ticket_data_source.dart
import 'dart:convert';

import 'package:martva/gen/assets.gen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/ticket.dto.dart';

part 'ticket_data_source.g.dart';

abstract class TicketDataSource {
  Future<List<TicketDto>> getTickets();
}

class AssetTicketDataSource implements TicketDataSource {
  @override
  Future<List<TicketDto>> getTickets() async {
    final jsonString = Assets.langs.ticketsGeTeoriaonge;
    final jsonList = json.decode(jsonString) as List;
    return jsonList.map((json) => TicketDto.fromJson(json)).toList();
  }
}

@riverpod
TicketDataSource ticketDataSource(TicketDataSourceRef ref) {
  return AssetTicketDataSource();
}
