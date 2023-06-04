import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2/firebase_options.dart';
import 'package:riverpod2/todo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Firebaseの初期化については今回の講座の範囲外なので、事前に済ませておいた。
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: Home()));
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    return MaterialApp(
      home: Scaffold(
          body: todos.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.docs.length,
            itemBuilder: (context, index) {
              final todo = data.docs[index].data();

              return ListTile(
                title: Text(todo['description']),
              );
            },
          );
        },
        error: (e, s) => const Center(
          child: Text('エラーです'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      )),
    );
  }
}
