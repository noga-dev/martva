// File: lib/data/repositories/ticket_repository_impl.dart
import 'package:martva/src/data/models/ticket.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/ticket_repository.dart';
import '../datasources/ticket_data_source.dart';

part 'ticket_repository_impl.g.dart';

class TicketRepositoryImpl implements TicketRepository {
  final TicketDataSource _dataSource;

  TicketRepositoryImpl(this._dataSource);

  @override
  Future<List<TicketDto>> getTickets() async {
    final ticketDtos = await _dataSource.getTickets();

    return ticketDtos;
  }

  @override
  TicketDto? getTicketById(int id) {
    // TODO: implement getTicketById
    throw UnimplementedError();
  }
}

@riverpod
TicketRepository ticketRepository(TicketRepositoryRef ref) {
  final dataSource = ref.watch(ticketDataSourceProvider);
  return TicketRepositoryImpl(dataSource);
}
