import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2/feature/todo/provider/todo_provider.dart';

import '../../model/todo.dart';

class TodoListTile extends ConsumerWidget {
  const TodoListTile({
    super.key,
    required this.todo,
  });

  final ToDo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
      value: todo.isCompleted,
      onChanged: (value) =>
          ref.read(todoControllerProvider.notifier).completeTodo(todo),
      title: Text(
        todo.description,
        style: TextStyle(
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
