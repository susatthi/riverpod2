import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo.g.dart';

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> todos(TodosRef ref) {
  return FirebaseFirestore.instance.collection('todo').snapshots();
}

@riverpod
class TodoFormController extends _$TodoFormController {
  @override
  FutureOr<void> build() {}

  Future<void> addTodo(String text) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      FirebaseFirestore.instance.collection('todo').add({
        'description': text,
        'isCompleted': false,
      });
    });
  }
}
