import 'package:flutter/material.dart';
import 'package:relearn/data/datavbase.dart';
import 'package:relearn/utils/dialoguebox.dart';
import 'package:relearn/utils/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _mybox = Hive.box('mybox');

  final _controller = TextEditingController();

  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // TODO: implement initState
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkChange(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add(
        [_controller.text, false],
      );
    });
    db.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
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
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodloTile(
              name: db.todoList[index][0],
              check: db.todoList[index][1],
              onchange: (value) => {checkChange(value, index)},
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
