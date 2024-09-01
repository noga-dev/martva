// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ticketRepoHash() => r'bab23ca84c68d593065d8ef664b49fa1bba1b594';

/// See also [ticketRepo].
@ProviderFor(ticketRepo)
final ticketRepoProvider = Provider<TicketRepo>.internal(
  ticketRepo,
  name: r'ticketRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ticketRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TicketRepoRef = ProviderRef<TicketRepo>;
String _$getTicketTranslationHash() =>
    r'c74102974496d3d1f78a22abdad4895da41df388';

/// See also [getTicketTranslation].
@ProviderFor(getTicketTranslation)
final getTicketTranslationProvider = Provider<TicketTranslation>.internal(
  getTicketTranslation,
  name: r'getTicketTranslationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getTicketTranslationHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef GetTicketTranslationRef = ProviderRef<TicketTranslation>;
String _$getTicketsHash() => r'47494b9aaed1cb11254f7d3717a3aa86ebcb01ff';

/// See also [getTickets].
@ProviderFor(getTickets)
final getTicketsProvider = AutoDisposeFutureProvider<List<TicketDto>>.internal(
  getTickets,
  name: r'getTicketsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getTicketsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTicketsRef = AutoDisposeFutureProviderRef<List<TicketDto>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
