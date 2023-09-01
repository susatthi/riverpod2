import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod2/feature/todo/model/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/firebase/firestore/firestore_provider.dart';

part 'todo_provider.g.dart';

/// 関数も提供できる
@riverpod
void Function() testFunction(TestFunctionRef ref) {
  return () {
    log('Call Test Function!');
  };
}

@riverpod
CollectionReference<ToDo?> todoReference(TodoReferenceRef ref) {
  return ref
      .watch(firebaseFirestoreProvider)
      .collection('todo')
      .withConverter<ToDo?>(
    fromFirestore: (ds, _) {
      final data = ds.data();
      if (data == null) {
        return null;
      }

      return ToDo.fromJson(data);
    },
    toFirestore: (value, _) {
      return value?.toJson() ?? {};
    },
  );
}

@riverpod
Stream<List<ToDo>> todos(TodosRef ref) {
  /// コメントを外してあえてエラーを起こしてみよう
  // throw Exception();

  return ref
      .watch(todoReferenceProvider)
      .orderBy('updatedAt', descending: true)
      .snapshots()
      .map(
        (event) => event.docs.map((e) => e.data()).nonNulls.toList(),
      );
}

/// TODO③：完了状態になっているTodoインスタンスはすべて下にまとまるように順番を変更するProviderを作ってみよう
/// todosProviderを使ってやれば簡単にできそうだね。

@riverpod
class TodoController extends _$TodoController {
  @override
  FutureOr<void> build() {}

  Future<void> addTodo(String text) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(todoReferenceProvider).add(ToDo(description: text));
    });
  }

  /// TODO②：指定したTodoインスタンスを完了状態に変更する関数を実装してみよう
  /// TodoクラスのisCompletedプロパティをtrueに変更すればいいね
}
