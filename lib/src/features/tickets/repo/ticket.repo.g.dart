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
String _$ticketOrdinalsByLicenseCategoryHash() =>
    r'a0d15316ee22b6987fbbe179ca5266ae97e3c03b';

/// See also [ticketOrdinalsByLicenseCategory].
@ProviderFor(ticketOrdinalsByLicenseCategory)
final ticketOrdinalsByLicenseCategoryProvider =
    AutoDisposeProvider<List<int>>.internal(
  ticketOrdinalsByLicenseCategory,
  name: r'ticketOrdinalsByLicenseCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ticketOrdinalsByLicenseCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TicketOrdinalsByLicenseCategoryRef = AutoDisposeProviderRef<List<int>>;
String _$ticketOrdinalsByQuestionCategoryHash() =>
    r'64eeccb90bc07a17639b9f67c39dbf9064a87329';

/// See also [ticketOrdinalsByQuestionCategory].
@ProviderFor(ticketOrdinalsByQuestionCategory)
final ticketOrdinalsByQuestionCategoryProvider =
    AutoDisposeProvider<List<int>>.internal(
  ticketOrdinalsByQuestionCategory,
  name: r'ticketOrdinalsByQuestionCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ticketOrdinalsByQuestionCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TicketOrdinalsByQuestionCategoryRef = AutoDisposeProviderRef<List<int>>;
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
String _$licenseCategoryNotifierHash() =>
    r'84dc48c5178f2c5e0718f2e2da172df7ccd2831a';

/// See also [LicenseCategoryNotifier].
@ProviderFor(LicenseCategoryNotifier)
final licenseCategoryNotifierProvider = AutoDisposeNotifierProvider<
    LicenseCategoryNotifier, LicenseCategory>.internal(
  LicenseCategoryNotifier.new,
  name: r'licenseCategoryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$licenseCategoryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LicenseCategoryNotifier = AutoDisposeNotifier<LicenseCategory>;
String _$questionCategoryNotifierHash() =>
    r'9c6d16bb7b0c06f619f495c609c5f80c5b0ca7bb';

/// See also [QuestionCategoryNotifier].
@ProviderFor(QuestionCategoryNotifier)
final questionCategoryNotifierProvider = AutoDisposeNotifierProvider<
    QuestionCategoryNotifier, QuestionCategory>.internal(
  QuestionCategoryNotifier.new,
  name: r'questionCategoryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$questionCategoryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$QuestionCategoryNotifier = AutoDisposeNotifier<QuestionCategory>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
