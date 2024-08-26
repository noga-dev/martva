// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatServiceHash() => r'744839917474002c80c13adca36c713c8480bd90';

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

abstract class _$ChatService
    extends BuildlessAutoDisposeStreamNotifier<List<ChatMessage>> {
  late final ChatType type;
  late final String id;

  Stream<List<ChatMessage>> build(
    ChatType type,
    String id,
  );
}

/// See also [ChatService].
@ProviderFor(ChatService)
const chatServiceProvider = ChatServiceFamily();

/// See also [ChatService].
class ChatServiceFamily extends Family<AsyncValue<List<ChatMessage>>> {
  /// See also [ChatService].
  const ChatServiceFamily();

  /// See also [ChatService].
  ChatServiceProvider call(
    ChatType type,
    String id,
  ) {
    return ChatServiceProvider(
      type,
      id,
    );
  }

  @override
  ChatServiceProvider getProviderOverride(
    covariant ChatServiceProvider provider,
  ) {
    return call(
      provider.type,
      provider.id,
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
  String? get name => r'chatServiceProvider';
}

/// See also [ChatService].
class ChatServiceProvider extends AutoDisposeStreamNotifierProviderImpl<
    ChatService, List<ChatMessage>> {
  /// See also [ChatService].
  ChatServiceProvider(
    ChatType type,
    String id,
  ) : this._internal(
          () => ChatService()
            ..type = type
            ..id = id,
          from: chatServiceProvider,
          name: r'chatServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatServiceHash,
          dependencies: ChatServiceFamily._dependencies,
          allTransitiveDependencies:
              ChatServiceFamily._allTransitiveDependencies,
          type: type,
          id: id,
        );

  ChatServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
    required this.id,
  }) : super.internal();

  final ChatType type;
  final String id;

  @override
  Stream<List<ChatMessage>> runNotifierBuild(
    covariant ChatService notifier,
  ) {
    return notifier.build(
      type,
      id,
    );
  }

  @override
  Override overrideWith(ChatService Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatServiceProvider._internal(
        () => create()
          ..type = type
          ..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<ChatService, List<ChatMessage>>
      createElement() {
    return _ChatServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatServiceProvider && other.type == type && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChatServiceRef
    on AutoDisposeStreamNotifierProviderRef<List<ChatMessage>> {
  /// The parameter `type` of this provider.
  ChatType get type;

  /// The parameter `id` of this provider.
  String get id;
}

class _ChatServiceProviderElement
    extends AutoDisposeStreamNotifierProviderElement<ChatService,
        List<ChatMessage>> with ChatServiceRef {
  _ChatServiceProviderElement(super.provider);

  @override
  ChatType get type => (origin as ChatServiceProvider).type;
  @override
  String get id => (origin as ChatServiceProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
