// srs_repository.dart
import 'package:martva/src/features/srs/domain/srs_item_dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'srs_repository.g.dart';

@riverpod
class SrsRepository extends _$SrsRepository {
  late final SupabaseClient _supabase;

  @override
  Future<void> build() async {
    _supabase = Supabase.instance.client;
  }

  Future<List<TicketDto>> getAllTickets() async {
    final response = await _supabase
        .from('tickets')
        .select('*, ticket_answers(*)')
        .order('ordinal_id');
    return response.map((ticket) => TicketDto.fromJson(ticket)).toList();
  }

  Future<List<SrsItemDto>> getSrsItems() async {
    final response =
        await _supabase.from('srs_items').select().order('nextDueDate');
    return response.map((item) => SrsItemDto.fromJson(item)).toList();
  }

  Future<List<SrsItemDto>> getDueItems() async {
    final response = await _supabase
        .from('srs_items')
        .select()
        .lte('nextDueDate', DateTime.now().toUtc().toIso8601String())
        .order('nextDueDate');
    return response.map((item) => SrsItemDto.fromJson(item)).toList();
  }

  Future<void> updateSrsItem(SrsItemDto item) async {
    await _supabase.from('srs_items').update(item.toJson()).eq('id', item.id);
  }

  Future<void> logSrsAttempt(SrsLogDto log) async {
    await _supabase.from('srs_logs').insert(log.toJson());
  }

  Future<SrsItemDto?> getOrCreateSrsItem(String ticketId) async {
    try {
      final response = await _supabase
          .from('srs_items')
          .select()
          .eq('ticketId', ticketId)
          .maybeSingle();

      if (response != null) {
        return SrsItemDto.fromJson(response);
      }
    } catch (e) {
      print('Error fetching SRS item: $e');
    }

    // If no item found or error occurred, create a new one
    final newItem = SrsItemDto(
      id: '',
      ticketId: ticketId,
      nextDueDate: DateTime.now().toUtc(),
      interval: 0,
      easeFactor: 2.5,
      createdAt: DateTime.now().toUtc(),
      updatedAt: DateTime.now().toUtc(),
    );

    try {
      final insertedItem = await _supabase
          .from('srs_items')
          .insert(newItem.toJson()..remove('id'))
          .select()
          .single();

      print('inserting for $ticketId');

      return SrsItemDto.fromJson(insertedItem);
    } catch (e) {
      print('Error creating new SRS item: $e');
      return null;
    }
  }

  Future<void> populateSrsItemsForExistingTickets() async {
    final tickets = await _supabase.from('tickets').select('id');
    for (final ticket in tickets) {
      await getOrCreateSrsItem(ticket['id']);
    }
  }

  Future<TicketDto?> getTicket(String ticketId) async {
    try {
      final response = await _supabase
          .from('tickets')
          .select('*, ticket_answers(*)')
          .eq('id', ticketId)
          .single();
      return TicketDto.fromJson(response);
    } catch (e) {
      print('Error fetching ticket: $e');
      return null;
    }
  }

  Future<List<SrsItemDto>> getNextDueItems({int limit = 10}) async {
    final response = await _supabase
        .from('srs_items')
        .select()
        .order('nextDueDate')
        .limit(limit);
    return response.map((item) => SrsItemDto.fromJson(item)).toList();
  }

  Future<Map<String, dynamic>> getSrsStatistics() async {
    final totalItems = await _supabase.from('srs_items').select('id').count();
    final dueItems = await _supabase
        .from('srs_items')
        .select('id')
        .lte('nextDueDate', DateTime.now().toUtc().toIso8601String());
    final totalLogs = await _supabase.from('srs_logs').select('id').count();
    final correctLogs =
        await _supabase.from('srs_logs').select('id').eq('isCorrect', true);

    return {
      'totalItems': totalItems.count,
      'dueItems': dueItems.length,
      'totalAttempts': totalLogs.count,
      'correctAttempts': correctLogs.length,
    };
  }
}
