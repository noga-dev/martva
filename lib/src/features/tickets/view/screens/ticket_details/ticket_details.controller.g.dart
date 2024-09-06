// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_details.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ticketDetailsControllerHash() =>
    r'6bc1035ec96e67d23d7ab0e7bca4e325417b638e';

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

abstract class _$TicketDetailsController
    extends BuildlessAutoDisposeAsyncNotifier<TicketDetailsState> {
  late final String id;

  FutureOr<TicketDetailsState> build({
    required String id,
  });
}

/// See also [TicketDetailsController].
@ProviderFor(TicketDetailsController)
const ticketDetailsControllerProvider = TicketDetailsControllerFamily();

/// See also [TicketDetailsController].
class TicketDetailsControllerFamily
    extends Family<AsyncValue<TicketDetailsState>> {
  /// See also [TicketDetailsController].
  const TicketDetailsControllerFamily();

  /// See also [TicketDetailsController].
  TicketDetailsControllerProvider call({
    required String id,
  }) {
    return TicketDetailsControllerProvider(
      id: id,
    );
  }

  @override
  TicketDetailsControllerProvider getProviderOverride(
    covariant TicketDetailsControllerProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'ticketDetailsControllerProvider';
}

/// See also [TicketDetailsController].
class TicketDetailsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TicketDetailsController,
        TicketDetailsState> {
  /// See also [TicketDetailsController].
  TicketDetailsControllerProvider({
    required String id,
  }) : this._internal(
          () => TicketDetailsController()..id = id,
          from: ticketDetailsControllerProvider,
          name: r'ticketDetailsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ticketDetailsControllerHash,
          dependencies: TicketDetailsControllerFamily._dependencies,
          allTransitiveDependencies:
              TicketDetailsControllerFamily._allTransitiveDependencies,
          id: id,
        );

  TicketDetailsControllerProvider._internal(
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
  FutureOr<TicketDetailsState> runNotifierBuild(
    covariant TicketDetailsController notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }

  @override
  Override overrideWith(TicketDetailsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: TicketDetailsControllerProvider._internal(
        () => create()..id = id,
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
  AutoDisposeAsyncNotifierProviderElement<TicketDetailsController,
      TicketDetailsState> createElement() {
    return _TicketDetailsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TicketDetailsControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TicketDetailsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<TicketDetailsState> {
  /// The parameter `id` of this provider.
  String get id;
}

class _TicketDetailsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TicketDetailsController,
        TicketDetailsState> with TicketDetailsControllerRef {
  _TicketDetailsControllerProviderElement(super.provider);

  @override
  String get id => (origin as TicketDetailsControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
