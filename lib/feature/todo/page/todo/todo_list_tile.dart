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
    return InkWell(
      onLongPress: () => showDialog(
          context: context, builder: (context) => _ConfirmDialog(todo: todo)),
      child: CheckboxListTile(
        value: todo.isCompleted,
        onChanged: (value) =>
            ref.read(todoControllerProvider.notifier).completeTodo(todo),
        title: Text(
          todo.description,
          style: TextStyle(
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Row(
          children: [
            Text(todo.id ?? 'null'),
            const Spacer(),
            Text(todo.updatedAt.dateTime.toString()),
          ],
        ),
      ),
    );
  }
}

class _ConfirmDialog extends ConsumerWidget {
  const _ConfirmDialog({
    required this.todo,
  });

  final ToDo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      content: Text('${todo.id}を削除しますか？'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'いいえ',
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            await ref.read(todoControllerProvider.notifier).deleteTodo(todo);
          },
          child: const Text(
            'はい',
          ),
        ),
      ],
    );
  }
}
