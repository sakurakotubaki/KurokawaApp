// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseFirestoreHash() => r'230b9276da2e44bb1aa6b300e1ddbb2f93c422da';

/// See also [firebaseFirestore].
@ProviderFor(firebaseFirestore)
final firebaseFirestoreProvider =
    AutoDisposeProvider<FirebaseFirestore>.internal(
  firebaseFirestore,
  name: r'firebaseFirestoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseFirestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseFirestoreRef = AutoDisposeProviderRef<FirebaseFirestore>;
String _$todoHash() => r'76858d66b70ce560e508001ce8a90519cfa08c09';

/// See also [todo].
@ProviderFor(todo)
final todoProvider = AutoDisposeStreamProvider<List<TodoModel>>.internal(
  todo,
  name: r'todoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodoRef = AutoDisposeStreamProviderRef<List<TodoModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
