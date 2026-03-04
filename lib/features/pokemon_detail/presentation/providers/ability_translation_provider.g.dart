// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability_translation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(abilityTranslation)
final abilityTranslationProvider = AbilityTranslationFamily._();

final class AbilityTranslationProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  AbilityTranslationProvider._({
    required AbilityTranslationFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'abilityTranslationProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$abilityTranslationHash();

  @override
  String toString() {
    return r'abilityTranslationProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    final argument = this.argument as String;
    return abilityTranslation(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AbilityTranslationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$abilityTranslationHash() =>
    r'51c62c0fe9c824ff2f6b2af0ae0386cfc25417c0';

final class AbilityTranslationFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String>, String> {
  AbilityTranslationFamily._()
    : super(
        retry: null,
        name: r'abilityTranslationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  AbilityTranslationProvider call(String abilityName) =>
      AbilityTranslationProvider._(argument: abilityName, from: this);

  @override
  String toString() => r'abilityTranslationProvider';
}
