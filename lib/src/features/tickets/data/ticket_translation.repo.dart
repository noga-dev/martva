import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_translation.repo.g.dart';

enum TicketTranslation {
  geOriginal,
  enGpt4oMini,
  ruGpt4oMini,
  ruOriginal,
  enOriginal;

  // problematic due to translations
  // String get name {
  //   switch (this) {
  //     case TicketTranslation.geOriginal:
  //       // TODO: Handle this case.
  //     case TicketTranslation.enGpt4oMini:
  //       // TODO: Handle this case.
  //     case TicketTranslation.ruGpt4oMini:
  //       // TODO: Handle this case.
  //     case TicketTranslation.ruOriginal:
  //       // TODO: Handle this case.
  //     case TicketTranslation.enOriginal:
  //       // TODO: Handle this case.
  //   }
  // }
}

@riverpod
class TicketTranslationRepo extends _$TicketTranslationRepo {
  @override
  TicketTranslation build() {
    return TicketTranslation.enGpt4oMini;
  }

  void update(TicketTranslation trans) {
    state = trans;
  }
}
