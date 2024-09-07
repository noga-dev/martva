import 'package:collection/collection.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/service/ticket.service.dart';
import 'package:martva/src/features/tickets/view/screens/ticket_details/ticket_details.state.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/ticket_card_organism.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_details.controller.g.dart';

@Riverpod(dependencies: [
  getTicketById,
  getTicketByOrdinal,
  getTicketByOrdinal,
])
class TicketDetailsController extends _$TicketDetailsController {
  @override
  Future<TicketDetailsState> build({
    required String id,
  }) async {
    if (id.contains('MoockMoock')) {
      return TicketDetailsState.skeleton();
    }

    final ticket = await ref.watch(getTicketByIdProvider(id: id).future);

    final previousAnswer = ticket.answers.firstWhereOrNull(
      (element) => element.ordinal == ticket.answers.firstOrNull?.ordinal,
    );

    final nextAndPreviousTickets = await _getNextAndPreviousTickets(ticket);

    final newQuestion = QuestionState(
      ticket: ticket,
      selectedAnswer: state.valueOrNull?.solution.selectedAnswer?.copyWith(
        id: previousAnswer?.id ?? '',
        ordinal: previousAnswer?.ordinal ?? 0,
        correct: previousAnswer?.correct ?? false,
        answer: previousAnswer?.answer ?? '',
      ),
      showExplanation: state.valueOrNull?.solution.showExplanation ?? false,
    );

    return state.valueOrNull?.copyWith(
          solution: newQuestion,
          nextTicketId: nextAndPreviousTickets.nextTicketId,
          prevTicketId: nextAndPreviousTickets.prevTicketId,
        ) ??
        TicketDetailsState(
          solution: newQuestion,
          nextTicketId: nextAndPreviousTickets.nextTicketId,
          prevTicketId: nextAndPreviousTickets.prevTicketId,
        );
  }

  Future<void> saveAnswer(AnswerDto answer) async {
    if (state.valueOrNull == null) {
      return;
    }

    state = AsyncData(
      state.value!.copyWith(
        solution: state.value!.solution.copyWith(
          selectedAnswer: answer,
          showExplanation: !answer.correct,
        ),
      ),
    );

    ref.read(ticketServiceProvider).setUserAnswer(
          ticketId: state.value!.solution.ticket.id,
          answerId: answer.id,
        );
  }

  Future<
      ({
        String nextTicketId,
        String prevTicketId,
      })> _getNextAndPreviousTickets(TicketDto ticket) async {
    final filteredTickets =
        await ref.read(filteredTicketOrdinalsProvider.future);

    final positionOfCurrentTicket = filteredTickets.indexOf(ticket.ordinalId);

    return (
      nextTicketId: positionOfCurrentTicket != filteredTickets.last
          ? (await ref.read(getTicketByOrdinalProvider(
                      ordinal: filteredTickets[positionOfCurrentTicket + 1])
                  .future))
              .id
          : '',
      prevTicketId: positionOfCurrentTicket != filteredTickets.first
          ? (await ref.read(getTicketByOrdinalProvider(
                      ordinal: filteredTickets[positionOfCurrentTicket - 1])
                  .future))
              .id
          : '',
    );
  }
}
