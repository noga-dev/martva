// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcards.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flashcardsControllerHash() =>
    r'f841ff9ffc8710c351b0d3ddbffbdfc921274f36';

/// See also [FlashcardsController].
@ProviderFor(FlashcardsController)
final flashcardsControllerProvider = AutoDisposeAsyncNotifierProvider<
    FlashcardsController, FlashcardsState>.internal(
  FlashcardsController.new,
  name: r'flashcardsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flashcardsControllerHash,
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

typedef _$FlashcardsController = AutoDisposeAsyncNotifier<FlashcardsState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
