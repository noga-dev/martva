import 'package:martva/src/core/i18n/data/localization.repo.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/screens/ticket_list/ticket_list.state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_list.controller.g.dart';

@Riverpod(dependencies: [
  LocalizationRepo,
  TicketTranslationNotifer,
  filteredTickets,
])
class TicketListController extends _$TicketListController {
  @override
  Future<TicketListState> build() async {
    ref.watch(licenseCategoryNotifierProvider);
    ref.watch(questionCategoryNotifierProvider);
    ref.watch(localizationRepoProvider);
    ref.watch(ticketTranslationNotiferProvider);

    return const TicketListState();
  }

  Future<
      ({
        List<TicketDto> tickets,
        bool isLastPage,
      })> fetchPage(int pageKey) async {
    final currentPage = pageKey;
    final newItems = await ref.read(
      filteredTicketsProvider(
        limit: state.value!.limit,
        offset: currentPage * state.value!.limit,
      ).future,
    );

    final isLastPage = newItems.tickets.isEmpty;

    if (isLastPage) {
      state = AsyncValue.data(
        TicketListState(
          tickets: [...state.value!.tickets, ...newItems.tickets],
        ),
      );
      return (
        tickets: <TicketDto>[],
        isLastPage: true,
      );
    } else {
      final nextPageKey = currentPage + 1;
      state = AsyncValue.data(
        TicketListState(
          page: nextPageKey,
          tickets: [...state.value!.tickets, ...newItems.tickets],
        ),
      );

      return (
        tickets: newItems.tickets,
        isLastPage: false,
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
