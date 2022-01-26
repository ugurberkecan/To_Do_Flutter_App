import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/page/home_page.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:todo_app/provider/todos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String title = 'Todo App';

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        title: title,
        theme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
        home: const HomePage(),
      ),
    );
  }
}
