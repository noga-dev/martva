import 'package:collection/collection.dart';
import 'package:martva/src/core/utils/messaging/logger.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/screens/ticket_details/ticket_details.state.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/ticket_card_organism.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_details.controller.g.dart';

@riverpod
class TicketDetailsController extends _$TicketDetailsController {
  @override
  Future<TicketDetailsState> build({
    required String id,
  }) async {
    final ticket = await ref.watch(getTicketByIdProvider(id: id).future);

    final previousAnswer = ticket.answers.firstWhereOrNull(
      (element) => element.ordinal == ticket.answers.firstOrNull?.ordinal,
    );

    return TicketDetailsState(
      solution: QuestionState(
        ticket: ticket,
        selectedAnswer: state.valueOrNull?.solution.selectedAnswer?.copyWith(
          id: previousAnswer?.id ?? '',
          ordinal: previousAnswer?.ordinal ?? 0,
          correct: previousAnswer?.correct ?? false,
          answer: previousAnswer?.answer ?? '',
        ),
        showExplanation: state.valueOrNull?.solution.showExplanation ?? false,
      ),
    );
  }

  Future<void> saveAnswer(AnswerDto answer) async {
    logger.d('saveAnswer: $answer');

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

    // todo: save answer to db
  }
}
