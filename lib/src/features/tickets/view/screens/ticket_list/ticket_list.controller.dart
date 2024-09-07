import 'package:martva/src/core/utils/messaging/logger.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/screens/ticket_list/ticket_list.state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_list.controller.g.dart';

@Riverpod(dependencies: [filteredTickets, filteredTickets])
class TicketListController extends _$TicketListController {
  @override
  Future<TicketListState> build() async {
    final filtered = await ref.watch(
      filteredTicketsProvider(limit: 0, offset: 0).future,
    );

    logger.w('filtered: ${filtered.totalCount}');

    return TicketListState(totalCount: filtered.totalCount);
  }

  Future<void> fetchPage(int pageKey) async {
    // if (pageKey != state.value!.page) {
    //   return;
    // }

    final currentPage = pageKey - 1;

    final newItems = await ref.read(
      filteredTicketsProvider(
        limit: state.value!.limit,
        offset: currentPage * state.value!.limit,
      ).future,
    );

    final isLastPage = newItems.tickets.isEmpty;

    if (isLastPage) {
      state = AsyncData(state.value!.copyWith(
        tickets: [...state.value!.tickets, ...newItems.tickets],
      ));
    } else {
      final nextPageKey = currentPage + 1;
      state = AsyncValue.data(
        state.value!.copyWith(
          page: nextPageKey,
          tickets: [...state.value!.tickets, ...newItems.tickets],
        ),
      );
    }
  }

  void updateTicket(TicketDto ticket) {
    state = const AsyncValue.data(
      TicketListState(),
    );
  }

  void updateSearchState({
    bool showSearchbar = false,
    String query = '',
  }) {
    state = AsyncValue.data(
      state.value!.copyWith(
        showSearchBar: showSearchbar,
        query: query,
      ),
    );
  }
}
