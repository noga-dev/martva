// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_list.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ticketListControllerHash() =>
    r'3271251f1103489c062f5e47d1b329e1fa3bfc42';

/// See also [TicketListController].
@ProviderFor(TicketListController)
final ticketListControllerProvider = AutoDisposeAsyncNotifierProvider<
    TicketListController, TicketListState>.internal(
  TicketListController.new,
  name: r'ticketListControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ticketListControllerHash,
  dependencies: <ProviderOrFamily>[filteredTicketsProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    filteredTicketsProvider,
    ...?filteredTicketsProvider.allTransitiveDependencies
  },
);

typedef _$TicketListController = AutoDisposeAsyncNotifier<TicketListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
