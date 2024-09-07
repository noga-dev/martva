// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_list.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ticketListControllerHash() =>
    r'1e349817d3ad33d47e215fe5c6e96a7f3e570de6';

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
