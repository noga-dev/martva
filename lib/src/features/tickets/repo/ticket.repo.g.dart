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
String _$getTicketsByIdHash() => r'95696b7d4a9a44ed05270a51301224fb9af678c2';

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

/// See also [getTicketsById].
@ProviderFor(getTicketsById)
const getTicketsByIdProvider = GetTicketsByIdFamily();

/// See also [getTicketsById].
class GetTicketsByIdFamily extends Family<AsyncValue<List<TicketDto>>> {
  /// See also [getTicketsById].
  const GetTicketsByIdFamily();

  /// See also [getTicketsById].
  GetTicketsByIdProvider call({
    required List<String> ids,
  }) {
    return GetTicketsByIdProvider(
      ids: ids,
    );
  }

  @override
  GetTicketsByIdProvider getProviderOverride(
    covariant GetTicketsByIdProvider provider,
  ) {
    return call(
      ids: provider.ids,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    localizationRepoProvider,
    ticketTranslationNotiferProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    localizationRepoProvider,
    ...?localizationRepoProvider.allTransitiveDependencies,
    ticketTranslationNotiferProvider,
    ...?ticketTranslationNotiferProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getTicketsByIdProvider';
}

/// See also [getTicketsById].
class GetTicketsByIdProvider
    extends AutoDisposeFutureProvider<List<TicketDto>> {
  /// See also [getTicketsById].
  GetTicketsByIdProvider({
    required List<String> ids,
  }) : this._internal(
          (ref) => getTicketsById(
            ref as GetTicketsByIdRef,
            ids: ids,
          ),
          from: getTicketsByIdProvider,
          name: r'getTicketsByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTicketsByIdHash,
          dependencies: GetTicketsByIdFamily._dependencies,
          allTransitiveDependencies:
              GetTicketsByIdFamily._allTransitiveDependencies,
          ids: ids,
        );

  GetTicketsByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ids,
  }) : super.internal();

  final List<String> ids;

  @override
  Override overrideWith(
    FutureOr<List<TicketDto>> Function(GetTicketsByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTicketsByIdProvider._internal(
        (ref) => create(ref as GetTicketsByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ids: ids,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TicketDto>> createElement() {
    return _GetTicketsByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTicketsByIdProvider && other.ids == ids;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ids.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTicketsByIdRef on AutoDisposeFutureProviderRef<List<TicketDto>> {
  /// The parameter `ids` of this provider.
  List<String> get ids;
}

class _GetTicketsByIdProviderElement
    extends AutoDisposeFutureProviderElement<List<TicketDto>>
    with GetTicketsByIdRef {
  _GetTicketsByIdProviderElement(super.provider);

  @override
  List<String> get ids => (origin as GetTicketsByIdProvider).ids;
}

String _$getTicketByIdHash() => r'511212f348132c86bddb6d492145fb102e2af06f';

/// See also [getTicketById].
@ProviderFor(getTicketById)
const getTicketByIdProvider = GetTicketByIdFamily();

/// See also [getTicketById].
class GetTicketByIdFamily extends Family<AsyncValue<TicketDto>> {
  /// See also [getTicketById].
  const GetTicketByIdFamily();

  /// See also [getTicketById].
  GetTicketByIdProvider call({
    required String id,
  }) {
    return GetTicketByIdProvider(
      id: id,
    );
  }

  @override
  GetTicketByIdProvider getProviderOverride(
    covariant GetTicketByIdProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    localizationRepoProvider,
    ticketTranslationNotiferProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    localizationRepoProvider,
    ...?localizationRepoProvider.allTransitiveDependencies,
    ticketTranslationNotiferProvider,
    ...?ticketTranslationNotiferProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getTicketByIdProvider';
}

/// See also [getTicketById].
class GetTicketByIdProvider extends AutoDisposeFutureProvider<TicketDto> {
  /// See also [getTicketById].
  GetTicketByIdProvider({
    required String id,
  }) : this._internal(
          (ref) => getTicketById(
            ref as GetTicketByIdRef,
            id: id,
          ),
          from: getTicketByIdProvider,
          name: r'getTicketByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTicketByIdHash,
          dependencies: GetTicketByIdFamily._dependencies,
          allTransitiveDependencies:
              GetTicketByIdFamily._allTransitiveDependencies,
          id: id,
        );

  GetTicketByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<TicketDto> Function(GetTicketByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTicketByIdProvider._internal(
        (ref) => create(ref as GetTicketByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TicketDto> createElement() {
    return _GetTicketByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTicketByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTicketByIdRef on AutoDisposeFutureProviderRef<TicketDto> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetTicketByIdProviderElement
    extends AutoDisposeFutureProviderElement<TicketDto> with GetTicketByIdRef {
  _GetTicketByIdProviderElement(super.provider);

  @override
  String get id => (origin as GetTicketByIdProvider).id;
}

String _$getTicketByOrdinalHash() =>
    r'851e1f24064e40442a9f874d5f96a6a7d7d8262a';

/// See also [getTicketByOrdinal].
@ProviderFor(getTicketByOrdinal)
const getTicketByOrdinalProvider = GetTicketByOrdinalFamily();

/// See also [getTicketByOrdinal].
class GetTicketByOrdinalFamily extends Family<AsyncValue<TicketDto>> {
  /// See also [getTicketByOrdinal].
  const GetTicketByOrdinalFamily();

  /// See also [getTicketByOrdinal].
  GetTicketByOrdinalProvider call({
    required int ordinal,
  }) {
    return GetTicketByOrdinalProvider(
      ordinal: ordinal,
    );
  }

  @override
  GetTicketByOrdinalProvider getProviderOverride(
    covariant GetTicketByOrdinalProvider provider,
  ) {
    return call(
      ordinal: provider.ordinal,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    localizationRepoProvider,
    ticketTranslationNotiferProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    localizationRepoProvider,
    ...?localizationRepoProvider.allTransitiveDependencies,
    ticketTranslationNotiferProvider,
    ...?ticketTranslationNotiferProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getTicketByOrdinalProvider';
}

/// See also [getTicketByOrdinal].
class GetTicketByOrdinalProvider extends AutoDisposeFutureProvider<TicketDto> {
  /// See also [getTicketByOrdinal].
  GetTicketByOrdinalProvider({
    required int ordinal,
  }) : this._internal(
          (ref) => getTicketByOrdinal(
            ref as GetTicketByOrdinalRef,
            ordinal: ordinal,
          ),
          from: getTicketByOrdinalProvider,
          name: r'getTicketByOrdinalProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTicketByOrdinalHash,
          dependencies: GetTicketByOrdinalFamily._dependencies,
          allTransitiveDependencies:
              GetTicketByOrdinalFamily._allTransitiveDependencies,
          ordinal: ordinal,
        );

  GetTicketByOrdinalProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ordinal,
  }) : super.internal();

  final int ordinal;

  @override
  Override overrideWith(
    FutureOr<TicketDto> Function(GetTicketByOrdinalRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTicketByOrdinalProvider._internal(
        (ref) => create(ref as GetTicketByOrdinalRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ordinal: ordinal,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TicketDto> createElement() {
    return _GetTicketByOrdinalProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTicketByOrdinalProvider && other.ordinal == ordinal;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ordinal.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTicketByOrdinalRef on AutoDisposeFutureProviderRef<TicketDto> {
  /// The parameter `ordinal` of this provider.
  int get ordinal;
}

class _GetTicketByOrdinalProviderElement
    extends AutoDisposeFutureProviderElement<TicketDto>
    with GetTicketByOrdinalRef {
  _GetTicketByOrdinalProviderElement(super.provider);

  @override
  int get ordinal => (origin as GetTicketByOrdinalProvider).ordinal;
}

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
String _$filteredTicketsHash() => r'cc9f6b0ffcfff21d12c497b5d0d85865a7b9f0d9';

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

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    localizationRepoProvider,
    ticketTranslationNotiferProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    localizationRepoProvider,
    ...?localizationRepoProvider.allTransitiveDependencies,
    ticketTranslationNotiferProvider,
    ...?ticketTranslationNotiferProvider.allTransitiveDependencies
  };

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

String _$filteredTicketOrdinalsHash() =>
    r'6ea4f3ccce93f16630b2816e8f915576beaea2df';

/// See also [filteredTicketOrdinals].
@ProviderFor(filteredTicketOrdinals)
final filteredTicketOrdinalsProvider =
    AutoDisposeFutureProvider<List<int>>.internal(
  filteredTicketOrdinals,
  name: r'filteredTicketOrdinalsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredTicketOrdinalsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredTicketOrdinalsRef = AutoDisposeFutureProviderRef<List<int>>;
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
    r'a7bf5403c835fb5755ed650ec04edaf3903b6d2e';

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
    r'2f0a474097dace2d1907784a16a028ad16757a9a';

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
