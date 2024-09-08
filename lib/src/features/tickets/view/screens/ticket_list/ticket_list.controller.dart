import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/screens/ticket_list/ticket_list.state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_list.controller.g.dart';

@Riverpod(dependencies: [
  filteredTickets,
])
class TicketListController extends _$TicketListController {
  @override
  Future<TicketListState> build() async {
    final filtered = await ref.watch(
      filteredTicketsProvider(limit: 0, offset: 0).future,
    );

    // logger.w('filtered: ${filtered.totalCount}');

    state = AsyncData(TicketListState(totalCount: filtered.totalCount));

    await ref.read(ticketListControllerProvider.notifier).loadMore();

    return state.value!;
  }

  Future<void> loadMore() async {
    final currentState = state.value!;
    // logger.w('loadMore: ${currentState.isLoading} ${currentState.hasMore}');
    if (currentState.isLoading || !currentState.hasMore) return;

    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    try {
      final newItems = await ref.read(
        filteredTicketsProvider(
          limit: currentState.limit,
          offset: currentState.tickets.length,
        ).future,
      );

      final updatedTickets = [...currentState.tickets, ...newItems.tickets];
      final hasMore = newItems.tickets.length == currentState.limit;

      state = AsyncValue.data(currentState.copyWith(
        tickets: updatedTickets,
        totalCount: newItems.totalCount,
        isLoading: false,
        hasMore: hasMore,
      ));

      // logger.d(
      //     'loadMore: ${updatedTickets.length} ${updatedTickets.map((e) => e.ordinalId).toList()}');
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.data(TicketListState());
    await loadMore();
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
