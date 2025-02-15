import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/router/router.dart';
import 'package:martva/src/core/theme/view/templates/shimmer.template.dart';
import 'package:martva/src/features/tickets/view/screens/ticket_details/ticket_details.controller.dart';
import 'package:martva/src/features/tickets/view/screens/ticket_details/ticket_details.state.dart';
import 'package:martva/src/features/tickets/view/screens/ticket_list/ticket_list.screen.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/quick_settings_organism.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/ticket_card_organism.dart';

class TicketDetailScreen extends HookConsumerWidget {
  const TicketDetailScreen({
    super.key,
    required this.ticketId,
  });

  final String ticketId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ticketDetailsControllerProvider(id: ticketId));

    return state.when(
      error: (error, stack) => Center(child: Text(error.toString())),
      loading: () => _Body(
        isLoading: true,
        screenState: TicketDetailsState.skeleton(),
      ),
      data: (data) => _Body(
        isLoading: false,
        screenState: data,
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    required this.isLoading,
    required this.screenState,
  });

  final TicketDetailsState screenState;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenController = ref.read(
        ticketDetailsControllerProvider(id: screenState.solution.ticket.id)
            .notifier);

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) => direction == DismissDirection.endToStart
          ? screenState.nextTicketId.isEmpty
              ? Navigator.of(context).pop()
              : TicketDetailsRoute(id: screenState.nextTicketId)
                  .replace(context)
          : screenState.prevTicketId.isEmpty
              ? Navigator.of(context).pop()
              : TicketDetailsRoute(id: screenState.prevTicketId)
                  .replace(context),
      background: IgnorePointer(
        child: screenState.prevTicketId.isEmpty
            ? const TicketListScreen()
            : TicketDetailScreen(ticketId: screenState.prevTicketId),
      ),
      secondaryBackground: IgnorePointer(
        child: screenState.nextTicketId.isEmpty
            ? const Scaffold(body: Center(child: Text('No next ticket')))
            : TicketDetailScreen(ticketId: screenState.nextTicketId),
      ),
      child: Scaffold(
        drawer: const QuickSettingsOrganism(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: ShimmerTemplate(
            enabled: isLoading,
            child: Row(
              children: [
                const BackButton(),
                Text('Ticket #${screenState.solution.ticket.ordinalId}'),
                const Spacer(),
                Builder(builder: (context) {
                  return IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(Icons.settings),
                  );
                }),
              ],
            ),
          ),
        ),
        body: ShimmerTemplate(
          enabled: isLoading,
          child: TicketCardOrganism(
            question: screenState.solution,
            onAnswerSelected: screenState.solution.selectedAnswer == null
                ? (answered) {
                    if (answered == null) {
                      return;
                    }

                    screenController.saveAnswer(answered);
                  }
                : null,
          ),
        ),
      ),
    );
  }
}
