import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/theme/view/tokens/ds_duration_tokens.dart';
import 'package:martva/src/core/theme/view/tokens/ds_spacing_tokens.dart';
import 'package:martva/src/core/utils/extensions/list.dart';
import 'package:martva/src/core/utils/methods/answer_color.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/shared/molecules/ticket_image_molecule.dart';

part 'ticket_card_organism.freezed.dart';

@freezed
class QuestionState with _$QuestionState {
  const factory QuestionState({
    required TicketDto ticket,
    @Default(null) AnswerDto? selectedAnswer,
    @Default(false) bool showExplanation,
  }) = _QuestionState;

  static QuestionState skeleton() => QuestionState(
        ticket: TicketDto.skeleton(),
        selectedAnswer: null,
        showExplanation: Random().nextBool(),
      );
}

class TicketCardOrganism extends HookConsumerWidget {
  const TicketCardOrganism({
    super.key,
    required this.question,
    required this.onAnswerSelected,
  });

  final QuestionState question;
  final ValueChanged<AnswerDto?>? onAnswerSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketTranslation = ref.watch(ticketTranslationNotiferProvider);

    return SingleChildScrollView(
      padding: DSSpacingTokens.xl.allInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSize(
            duration: DSDurationTokens.xxxs.duration,
            reverseDuration: DSDurationTokens.xxxs.duration,
            curve: Curves.linear,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: question.showExplanation
                  ? [
                      Card(
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: DSSpacingTokens.m.allInsets,
                          child: Text(
                            question.ticket.explanation.isEmpty
                                ? 'No explanation from ${ticketTranslation.name}.'
                                    ' Change source in settings.'
                                : question.ticket.explanation,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      DSSpacingTokens.l.verticalBox,
                    ]
                  : [const SizedBox.shrink()],
            ),
          ),
          Text(question.ticket.question),
          DSSpacingTokens.xxl.verticalBox,
          if (question.ticket.image.isNotEmpty) ...[
            TicketImageMolecule(ticket: question.ticket),
            DSSpacingTokens.xxl.verticalBox,
          ],
          ...question.ticket.answers.map<Widget>((answer) {
            return Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: getAnswerColor(
                    answer: answer,
                    solution: question.selectedAnswer,
                  ),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: RadioListTile<AnswerDto>.adaptive(
                value: answer,
                groupValue: question.selectedAnswer,
                onChanged: onAnswerSelected,
                fillColor: WidgetStateProperty.all(
                  getAnswerColor(
                    answer: answer,
                    solution: question.selectedAnswer,
                  ),
                ),
                dense: true,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                title: Text(
                  answer.answer,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          }).intersperse(DSSpacingTokens.xxl.verticalBox),
        ],
      ),
    );
  }
}
