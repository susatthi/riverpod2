import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2/feature/todo/page/todo/todo_list_view.dart';

import 'todo_form.dart';

class ToDoPage extends ConsumerWidget {
  const ToDoPage({super.key});

  static const path = '/todo';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TodoListView(),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TodoForm(),
            ),
          ],
        ),
      ),
    );
  }
}
