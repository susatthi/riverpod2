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
    return const MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: TodoListView(),
            ),
            TodoForm(),
          ],
        ),
      ),
    );
  }
}

class TodoForm extends ConsumerStatefulWidget {
  const TodoForm({super.key});

  @override
  ConsumerState<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends ConsumerState<TodoForm> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  /// TextEditingControllerを操作するため関数でラップする。
  Future<void> addTodo() async {
    ref
        .read(todoFormControllerProvider.notifier)
        .addTodo(textEditingController.text);
    textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(todoFormControllerProvider);

    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: textEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          if (state.isLoading)
            const CircularProgressIndicator()
          else
            IconButton(
              onPressed: textEditingController.text.isEmpty ? null : addTodo,
              icon: const Icon(Icons.send),
            )
        ],
      ),
    );
  }
}

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    return todos.when(
      data: (data) {
        return ListView.builder(
          shrinkWrap: true,
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
    );
  }
}
