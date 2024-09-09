// lib/features/flashcards/presentation/review/review_screen.state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/features/srs/dto/flashcard.dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';

part 'flashcards.state.freezed.dart';

@freezed
class FlashcardsState with _$FlashcardsState {
  const factory FlashcardsState({
    @Default([]) List<TicketDto> tickets,
    @Default([]) List<FlashcardDto> dueFlashcards,
    TicketDto? currentTicket,
    FlashcardDto? currentFlashcard,
  }) = _FlashcardsState;
}
