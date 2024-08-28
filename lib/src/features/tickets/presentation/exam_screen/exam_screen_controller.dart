import 'package:martva/src/features/tickets/data/ticket.repo.dart';
import 'package:martva/src/features/tickets/domain/ticket.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exam_screen_controller.g.dart';

@riverpod
class ExamScreenController extends _$ExamScreenController {
  @override
  FutureOr<List<TicketDto>> build() async {
    final tickets = await ref.watch(ticketRepoProvider.future);

    final shuffled = tickets..shuffle();

    final selected = shuffled.take(30);

    final list = selected.toList();

    return list;
  }

  // CartService get cartService => ref.read(cartServiceProvider);

  // Future<void> updateItemQuantity(ProductID productId, int quantity) async {
  //   state = const AsyncLoading();
  //   final updated = Item(productId: productId, quantity: quantity);
  //   state = await AsyncValue.guard(() => cartService.setItem(updated));
  // }

  // Future<void> removeItemById(ProductID productId) async {
  //   state = const AsyncLoading();
  //   state = await AsyncValue.guard(() => cartService.removeItemById(productId));
  // }
}
