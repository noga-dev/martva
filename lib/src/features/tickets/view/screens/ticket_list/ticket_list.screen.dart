import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:martva/src/core/utils/enums/license_category.dart';
import 'package:martva/src/core/utils/enums/question_category.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/screens/ticket_details/ticket_details.dart';
import 'package:martva/src/features/tickets/view/screens/ticket_list/ticket_list.controller.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/ticket_card_organism.dart';

class TicketsScreen extends HookConsumerWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ticketListControllerProvider);
    final controller = ref.read(ticketListControllerProvider.notifier);
    final pagingController = useMemoized(
        () => PagingController<int, TicketDto>(
              firstPageKey: 0,
            ),
        []);

    useEffect(() {
      pagingController.addPageRequestListener((pageKey) async {
        try {
          final result = await controller.fetchPage(pageKey);
          if (result.isLastPage) {
            pagingController.appendLastPage(result.tickets);
          } else {
            pagingController.appendPage(result.tickets, pageKey + 1);
          }
        } catch (e) {
          pagingController.error = e;
        }
      });
      return () {
        pagingController.dispose();
      };
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        actions: const [
          _LicenseCategory(),
          _QuestionCategory(),
        ],
      ),
      body: state.when(
        data: (tickets) => PagedListView<int, TicketDto>(
          pagingController: pagingController,
          builderDelegate: PagedChildBuilderDelegate<TicketDto>(
            firstPageErrorIndicatorBuilder: (context) => const Center(
              child: Text('Error'),
            ),
            noItemsFoundIndicatorBuilder: (context) => const Center(
              child: Text('No items found'),
            ),
            firstPageProgressIndicatorBuilder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
            newPageErrorIndicatorBuilder: (context) => const Center(
              child: Text('Error'),
            ),
            newPageProgressIndicatorBuilder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
            noMoreItemsIndicatorBuilder: (context) => const Center(
              child: Text('No more items'),
            ),
            itemBuilder: (context, item, index) => Column(
              children: [
                Text(
                  '${item.ordinalId}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TicketCardOrganism(
                  onAnswerSelected: (answer) {
                    ref
                        .read(ticketListControllerProvider.notifier)
                        .updateTicket(item.copyWith(
                            //  selectedAnswer: answer,
                            ));
                  },
                  question: QuestionState(
                    ticket: item,
                  ),
                ),
              ],
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text(error.toString())),
      ),
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
      trailing: const Text(
        // 'Next review:\n${dueItem.nextReviewDate.toString().split(' ')[0]}',
        'sdasd',
      ),
      subtitle: const Wrap(
        children: [
          _Tag.one(),
          _Tag.two(),
          _Tag.three(),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TicketDetailScreen(ticketId: ticket.id),
          ),
        );
      },
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag.one() : color = Colors.red;
  const _Tag.two() : color = Colors.blue;
  const _Tag.three() : color = Colors.green;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Chip(
      // labelPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      label: const Text('test'),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      backgroundColor: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
