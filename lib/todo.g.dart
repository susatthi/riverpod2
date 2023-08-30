// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todosHash() => r'5ba6866806ea1e3a4f8e986c27d235b9f478fc0e';

/// See also [todos].
@ProviderFor(todos)
final todosProvider =
    AutoDisposeStreamProvider<QuerySnapshot<Map<String, dynamic>>>.internal(
  todos,
  name: r'todosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodosRef
    = AutoDisposeStreamProviderRef<QuerySnapshot<Map<String, dynamic>>>;
String _$todoFormControllerHash() =>
    r'4df9fea2cda89e78f0b7ba38752b923a5a362d54';

/// See also [TodoFormController].
@ProviderFor(TodoFormController)
final todoFormControllerProvider =
    AutoDisposeAsyncNotifierProvider<TodoFormController, void>.internal(
  TodoFormController.new,
  name: r'todoFormControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoFormControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoFormController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
