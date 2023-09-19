import 'package:flutter/material.dart';
import 'package:relearn/utils/dialoguebox.dart';
import 'package:relearn/utils/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  List todoList = [
    ["Test", false]
  ];

  void checkChange(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todoList.add(
        [_controller.text, false],
      );
    });
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  // Create new task
  void newCreateTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogueBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: const Center(
            child: Text(
              "T O D O",
              style: TextStyle(color: Colors.black38),
            ),
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            newCreateTask();
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodloTile(
              name: todoList[index][0],
              check: todoList[index][1],
              onchange: (value) => {checkChange(value, index)},
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
