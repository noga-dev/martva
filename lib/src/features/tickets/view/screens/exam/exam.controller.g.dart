// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$examControllerHash() => r'fc271e87eb1861ae022d827d305f4ac835ee41f1';

/// See also [ExamController].
@ProviderFor(ExamController)
final examControllerProvider =
    AutoDisposeAsyncNotifierProvider<ExamController, ExamState>.internal(
  ExamController.new,
  name: r'examControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$examControllerHash,
  dependencies: <ProviderOrFamily>[getExamTicketsProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    getExamTicketsProvider,
    ...?getExamTicketsProvider.allTransitiveDependencies
  },
);

typedef _$ExamController = AutoDisposeAsyncNotifier<ExamState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
