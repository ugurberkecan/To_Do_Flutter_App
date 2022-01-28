import 'package:flutter/material.dart';
import 'package:todo_app/widget/completed_list_widger.dart';

import '../widget/add_todo_dialog.dart';
import '../widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoListWidget(),
      const CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fact_check_outlined,
              color: Colors.white,
            ),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.done,
                size: 28,
                color: Colors.white,
              ),
              label: 'Completed'),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          builder: (context) => const AddToDoDialog(),
          context: context,
          barrierDismissible: true,
        ),
      ),
    );
  }
}
