import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/router/router.dart';
import 'package:martva/src/core/theme/view/templates/shimmer.template.dart';
import 'package:martva/src/core/utils/enums/license_category.dart';
import 'package:martva/src/core/utils/enums/question_category.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/screens/ticket_list/ticket_list.controller.dart';
import 'package:martva/src/features/tickets/view/screens/ticket_list/ticket_list.state.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/quick_settings_organism.dart';

class TicketListScreen extends HookConsumerWidget {
  const TicketListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenState = ref.watch(ticketListControllerProvider);

    return screenState.when(
      error: (error, stack) => Center(child: Text(error.toString())),
      loading: () => _TicketsBody(
        isLoading: true,
        screenState: TicketListState.skeleton(),
      ),
      data: (state) => _TicketsBody(
        isLoading: false,
        screenState: state,
      ),
    );
  }
}

class _TicketsBody extends HookConsumerWidget {
  const _TicketsBody({
    required this.isLoading,
    required this.screenState,
  });

  final bool isLoading;
  final TicketListState screenState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: const QuickSettingsOrganism(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ShimmerTemplate(
          enabled: isLoading,
          child: Row(
            children: [
              BackButton(
                onPressed: () => screenState.showSearchBar == true
                    ? ref
                        .read(ticketListControllerProvider.notifier)
                        .updateSearchState(showSearchbar: false)
                    : context.pop(),
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: screenState.showSearchBar
                      ? Focus(
                          onFocusChange: (hasFocus) {
                            if (!hasFocus) {
                              ref
                                  .read(ticketListControllerProvider.notifier)
                                  .updateSearchState(showSearchbar: false);
                            }
                          },
                          child: SearchBar(
                            onChanged: (value) {
                              ref
                                  .read(ticketListControllerProvider.notifier)
                                  .updateSearchState(query: value);
                            },
                            autoFocus: true,
                            onSubmitted: (value) => ref
                                .read(ticketListControllerProvider.notifier)
                                .updateSearchState(showSearchbar: false),
                          ),
                        )
                      : Row(
                          children: [
                            const Text('Library'),
                            const Spacer(),
                            IconButton(
                              onPressed: () => ref
                                  .read(ticketListControllerProvider.notifier)
                                  .updateSearchState(showSearchbar: true),
                              icon: const Icon(Icons.search),
                            ),
                            const _LicenseCategory(),
                            const _QuestionCategory(),
                            Builder(builder: (context) {
                              return IconButton(
                                onPressed: () =>
                                    Scaffold.of(context).openDrawer(),
                                icon: const Icon(Icons.settings),
                              );
                            }),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ShimmerTemplate(
        enabled: isLoading,
        child: ListView.builder(
          itemCount: screenState.totalCount,
          itemBuilder: (context, index) {
            return _TicketListPage(
              page: index ~/ screenState.limit + 1,
              pageSize: screenState.limit,
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class _TicketListPage extends HookConsumerWidget {
  const _TicketListPage({
    required this.page,
    required this.pageSize,
    required this.index,
  });

  final int page;
  final int pageSize;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenState = ref.watch(ticketListControllerProvider);
    final fetchPageFuture = useMemoized(
        () => ref.read(ticketListControllerProvider.notifier).fetchPage(page),
        []);
    final fetchPageResult = useFuture(fetchPageFuture);

    return screenState.when(
      error: (error, stack) => Center(child: Text(error.toString())),
      loading: () => TicketListItem(ticket: TicketDto.skeleton()),
      data: (data) {
        if (index % pageSize >= data.totalCount) {
          return const Icon(Icons.last_page);
        }

        if (fetchPageResult.hasError) {
          return Center(child: Text(fetchPageResult.error.toString()));
        }

        if (screenState.valueOrNull?.tickets.elementAtOrNull(index) == null) {
          return TicketListItem(ticket: TicketDto.skeleton());
        }

        // logger.d('fetchPage: $index $page');

        return ShimmerTemplate(
          enabled: fetchPageResult.connectionState == ConnectionState.waiting,
          child: TicketListItem(
            ticket: screenState.value!.tickets
                    .firstWhereIndexedOrNull((i, j) => i == index) ??
                TicketDto.skeleton(),
          ),
        );
      },
    );
  }
}

class _QuestionCategory extends ConsumerWidget {
  const _QuestionCategory();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final question = ref.watch(questionCategoryNotifierProvider);

    return PopupMenuButton(
      icon: question.icon,
      itemBuilder: (context) => QuestionCategory.values
          .map((e) => PopupMenuItem(
                value: e,
                onTap: () => ref
                    .read(questionCategoryNotifierProvider.notifier)
                    .update(e),
                child: _CategoryItem(
                  selected: question == e,
                  icon: e.icon,
                  name: e.name,
                ),
              ))
          .toList(),
    );
  }
}

class _LicenseCategory extends ConsumerWidget {
  const _LicenseCategory();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final license = ref.watch(licenseCategoryNotifierProvider);

    return PopupMenuButton<LicenseCategory>(
      icon: license.icon,
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
      itemBuilder: (context) => LicenseCategory.values
          .map((e) => PopupMenuItem(
                value: e,
                onTap: () => ref
                    .read(licenseCategoryNotifierProvider.notifier)
                    .update(e),
                child: _CategoryItem(
                  selected: license == e,
                  icon: e.icon,
                  name: e.name,
                ),
              ))
          .toList(),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.selected,
    required this.icon,
    required this.name,
  });

  final bool selected;
  final Icon icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: TextButton.icon(
        style: selected
            ? TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationThickness: 4,
                      decorationColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.5),
                    ),
                padding: EdgeInsets.zero,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10),
                //   side: BorderSide(
                //     color: Theme.of(context).colorScheme.primary,
                //   ),
                // ),
              )
            : TextButton.styleFrom(
                padding: EdgeInsets.zero,
                foregroundColor: Theme.of(context).colorScheme.tertiary,
              ),
        icon: icon,
        label: Text(name),
        onPressed: () {},
      ),
    );
  }
}

class TicketListItem extends HookConsumerWidget {
  const TicketListItem({
    super.key,
    required this.ticket,
  });

  final TicketDto ticket;

  @override
  Widget build(BuildContext context, ref) {
    return ListTile(
      leading: Text(ticket.ordinalId.toString()),
      title: Text(ticket.question),
      isThreeLine: true,
      // trailing: const Text(
      //   'Next review:\n${dueItem.nextReviewDate.toString().split(' ')[0]}',
      // ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: QuestionCategory.valuesBarAll
                .where((e) => e.tickets.contains(ticket.ordinalId))
                .map((e) => _Tag(
                      name: e.name,
                      color: e.color.withOpacity(0.5),
                    ))
                .toList(),
          ),
        ],
      ),
      trailing: SizedBox(
        width: 132,
        child: Wrap(
          spacing: 4,
          runSpacing: 4,
          children: LicenseCategory.valuesBarAll
              .where((e) => e.tickets.contains(ticket.ordinalId))
              .map((e) => _Tag(
                    name: e.selectName,
                    color: e.color.withOpacity(0.5),
                  ))
              .toList(),
        ),
      ),
      onTap: () => TicketDetailsRoute(id: ticket.id).push(context),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({
    required this.name,
    required this.color,
  });

  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Chip(
      // labelPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      label: Text(name),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      backgroundColor: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
