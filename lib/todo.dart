import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo.g.dart';

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> todos(TodosRef ref) {
  return FirebaseFirestore.instance.collection('todo').snapshots();
}
