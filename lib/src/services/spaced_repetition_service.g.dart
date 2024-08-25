// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spaced_repetition_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$spacedRepetitionServiceHash() =>
    r'b6eb16e15d998461ecf2ab1d8771e7f7ad2cd260';

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

abstract class _$SpacedRepetitionService
    extends BuildlessAutoDisposeNotifier<List<SpacedRepetitionItem>> {
  late final List<TicketDto> tickets;

  List<SpacedRepetitionItem> build(
    List<TicketDto> tickets,
  );
}

/// See also [SpacedRepetitionService].
@ProviderFor(SpacedRepetitionService)
const spacedRepetitionServiceProvider = SpacedRepetitionServiceFamily();

/// See also [SpacedRepetitionService].
class SpacedRepetitionServiceFamily extends Family<List<SpacedRepetitionItem>> {
  /// See also [SpacedRepetitionService].
  const SpacedRepetitionServiceFamily();

  /// See also [SpacedRepetitionService].
  SpacedRepetitionServiceProvider call(
    List<TicketDto> tickets,
  ) {
    return SpacedRepetitionServiceProvider(
      tickets,
    );
  }

  @override
  SpacedRepetitionServiceProvider getProviderOverride(
    covariant SpacedRepetitionServiceProvider provider,
  ) {
    return call(
      provider.tickets,
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
  String? get name => r'spacedRepetitionServiceProvider';
}

/// See also [SpacedRepetitionService].
class SpacedRepetitionServiceProvider extends AutoDisposeNotifierProviderImpl<
    SpacedRepetitionService, List<SpacedRepetitionItem>> {
  /// See also [SpacedRepetitionService].
  SpacedRepetitionServiceProvider(
    List<TicketDto> tickets,
  ) : this._internal(
          () => SpacedRepetitionService()..tickets = tickets,
          from: spacedRepetitionServiceProvider,
          name: r'spacedRepetitionServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$spacedRepetitionServiceHash,
          dependencies: SpacedRepetitionServiceFamily._dependencies,
          allTransitiveDependencies:
              SpacedRepetitionServiceFamily._allTransitiveDependencies,
          tickets: tickets,
        );

  SpacedRepetitionServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tickets,
  }) : super.internal();

  final List<TicketDto> tickets;

  @override
  List<SpacedRepetitionItem> runNotifierBuild(
    covariant SpacedRepetitionService notifier,
  ) {
    return notifier.build(
      tickets,
    );
  }

  @override
  Override overrideWith(SpacedRepetitionService Function() create) {
    return ProviderOverride(
      origin: this,
      override: SpacedRepetitionServiceProvider._internal(
        () => create()..tickets = tickets,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tickets: tickets,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SpacedRepetitionService,
      List<SpacedRepetitionItem>> createElement() {
    return _SpacedRepetitionServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SpacedRepetitionServiceProvider && other.tickets == tickets;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tickets.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SpacedRepetitionServiceRef
    on AutoDisposeNotifierProviderRef<List<SpacedRepetitionItem>> {
  /// The parameter `tickets` of this provider.
  List<TicketDto> get tickets;
}

class _SpacedRepetitionServiceProviderElement
    extends AutoDisposeNotifierProviderElement<SpacedRepetitionService,
        List<SpacedRepetitionItem>> with SpacedRepetitionServiceRef {
  _SpacedRepetitionServiceProviderElement(super.provider);

  @override
  List<TicketDto> get tickets =>
      (origin as SpacedRepetitionServiceProvider).tickets;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
