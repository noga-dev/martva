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
String _$getRandomTicketIdsHash() =>
    r'109c9c313c5dfd19d3ab6806cc3fb36821837cd2';

/// See also [getRandomTicketIds].
@ProviderFor(getRandomTicketIds)
final getRandomTicketIdsProvider =
    AutoDisposeFutureProvider<List<String>>.internal(
  getRandomTicketIds,
  name: r'getRandomTicketIdsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getRandomTicketIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetRandomTicketIdsRef = AutoDisposeFutureProviderRef<List<String>>;
String _$getExamTicketsHash() => r'677c3b4e55feac0b01a78439883909ba13c85d87';

/// See also [getExamTickets].
@ProviderFor(getExamTickets)
final getExamTicketsProvider =
    AutoDisposeFutureProvider<List<TicketDto>>.internal(
  getExamTickets,
  name: r'getExamTicketsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getExamTicketsHash,
  dependencies: <ProviderOrFamily>[
    localizationRepoProvider,
    ticketTranslationNotiferProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    localizationRepoProvider,
    ...?localizationRepoProvider.allTransitiveDependencies,
    ticketTranslationNotiferProvider,
    ...?ticketTranslationNotiferProvider.allTransitiveDependencies
  },
);

typedef GetExamTicketsRef = AutoDisposeFutureProviderRef<List<TicketDto>>;
String _$getTicketsHash() => r'fcf919509a523d951237af5f0a7312cf83bf532d';

/// See also [getTickets].
@ProviderFor(getTickets)
final getTicketsProvider = AutoDisposeFutureProvider<List<TicketDto>>.internal(
  getTickets,
  name: r'getTicketsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getTicketsHash,
  dependencies: <ProviderOrFamily>[
    localizationRepoProvider,
    ticketTranslationNotiferProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    localizationRepoProvider,
    ...?localizationRepoProvider.allTransitiveDependencies,
    ticketTranslationNotiferProvider,
    ...?ticketTranslationNotiferProvider.allTransitiveDependencies
  },
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
