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
String _$getExamTicketsHash() => r'14e8521f10bcc80851f71ebd48644b9c1b4dd70d';

/// See also [getExamTickets].
@ProviderFor(getExamTickets)
final getExamTicketsProvider =
    AutoDisposeFutureProvider<List<TicketDto>>.internal(
  getExamTickets,
  name: r'getExamTicketsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getExamTicketsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetExamTicketsRef = AutoDisposeFutureProviderRef<List<TicketDto>>;
String _$getTicketsHash() => r'2ea5c8d6480dc6c4ad5a52db07b73752e90b6184';

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
String _$ticketTranslationNotiferHash() =>
    r'7475b6334ca3c19c0effb765725c9e3f9fc41df1';

/// See also [TicketTranslationNotifer].
@ProviderFor(TicketTranslationNotifer)
final ticketTranslationNotiferProvider =
    NotifierProvider<TicketTranslationNotifer, TicketTranslation>.internal(
  TicketTranslationNotifer.new,
  name: r'ticketTranslationNotiferProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ticketTranslationNotiferHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef _$TicketTranslationNotifer = Notifier<TicketTranslation>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
