import 'package:flutter/material.dart';
import 'package:todo_app/widget/TodoFormWidget.dart';

class AddToDoDialog extends StatefulWidget {
  AddToDoDialog({Key? key}) : super(key: key);

  @override
  State<AddToDoDialog> createState() => _AddToDoDialogState();
}

class _AddToDoDialogState extends State<AddToDoDialog> {
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
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
              onSavedTodo: () {},
            )
          ],
        ),
      );
}
