import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widget/TodoFormWidget.dart';

import '../model/todo.dart';

class AddToDoDialog extends StatefulWidget {
  const AddToDoDialog({Key? key}) : super(key: key);

  @override
  State<AddToDoDialog> createState() => _AddToDoDialogState();
}

class _AddToDoDialogState extends State<AddToDoDialog> {
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Todo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TodoFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedTodo: addTodo,
              )
            ],
          ),
        ),
      );

  void addTodo() {
    final isValid = _formkey.currentState?.validate();

    if (!isValid!) {
      return;
    } else {
      final todo = Todo(
          id: DateTime.now().toString(),
          createdTime: DateTime.now(),
          title: title,
          description: description);
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
