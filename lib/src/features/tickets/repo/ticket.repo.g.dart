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
String _$filteredTicketsHash() => r'2d0eaa0b5036f4daf5a410a3193b415e47499f36';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [filteredTickets].
@ProviderFor(filteredTickets)
const filteredTicketsProvider = FilteredTicketsFamily();

/// See also [filteredTickets].
class FilteredTicketsFamily
    extends Family<AsyncValue<({List<TicketDto> tickets, int totalCount})>> {
  /// See also [filteredTickets].
  const FilteredTicketsFamily();

  /// See also [filteredTickets].
  FilteredTicketsProvider call({
    required int limit,
    required int offset,
  }) {
    return FilteredTicketsProvider(
      limit: limit,
      offset: offset,
    );
  }

  @override
  FilteredTicketsProvider getProviderOverride(
    covariant FilteredTicketsProvider provider,
  ) {
    return call(
      limit: provider.limit,
      offset: provider.offset,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredTicketsProvider';
}

/// See also [filteredTickets].
class FilteredTicketsProvider extends AutoDisposeFutureProvider<
    ({List<TicketDto> tickets, int totalCount})> {
  /// See also [filteredTickets].
  FilteredTicketsProvider({
    required int limit,
    required int offset,
  }) : this._internal(
          (ref) => filteredTickets(
            ref as FilteredTicketsRef,
            limit: limit,
            offset: offset,
          ),
          from: filteredTicketsProvider,
          name: r'filteredTicketsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredTicketsHash,
          dependencies: FilteredTicketsFamily._dependencies,
          allTransitiveDependencies:
              FilteredTicketsFamily._allTransitiveDependencies,
          limit: limit,
          offset: offset,
        );

  FilteredTicketsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.offset,
  }) : super.internal();

  final int limit;
  final int offset;

  @override
  Override overrideWith(
    FutureOr<({List<TicketDto> tickets, int totalCount})> Function(
            FilteredTicketsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredTicketsProvider._internal(
        (ref) => create(ref as FilteredTicketsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        offset: offset,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<({List<TicketDto> tickets, int totalCount})>
      createElement() {
    return _FilteredTicketsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredTicketsProvider &&
        other.limit == limit &&
        other.offset == offset;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, offset.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FilteredTicketsRef on AutoDisposeFutureProviderRef<
    ({List<TicketDto> tickets, int totalCount})> {
  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `offset` of this provider.
  int get offset;
}

class _FilteredTicketsProviderElement extends AutoDisposeFutureProviderElement<
    ({List<TicketDto> tickets, int totalCount})> with FilteredTicketsRef {
  _FilteredTicketsProviderElement(super.provider);

  @override
  int get limit => (origin as FilteredTicketsProvider).limit;
  @override
  int get offset => (origin as FilteredTicketsProvider).offset;
}

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
