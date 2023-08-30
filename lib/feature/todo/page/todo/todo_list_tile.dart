import 'package:flutter/material.dart';

import '../../model/todo.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.todo,
  });

  final ToDo todo;

  @override
  Widget build(BuildContext context) {
    /// TODO①：完了状態に変更できるよUIを作成しよう
    return ListTile(
      title: Text(todo.description),
    );
  }
}
