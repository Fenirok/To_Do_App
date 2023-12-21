import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/database/database.dart';
import 'package:todoapp/util/to_do_tile.dart';
import '../util/dialouge_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box('myBox');

  //text controller
  final _control = TextEditingController();

  TodoDataBase db = TodoDataBase();
  @override
  void initState() {
    // if this is the first time opening the app
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // this is the method which helps to on and off the item checkbox//
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }

  void createnewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            control: _control,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

//save new task
  void saveNewTask() {
    setState(() {
      db.todoList.add([_control.text, false]);
      _control.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: const Center(child: Text('TO DO')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewTask,
        child: const Icon(Icons.add),
      ),
      body: db.todoList.isEmpty
          ? const Center(
              child: Text('Nothing to Do!', style: TextStyle(fontSize: 18),),
            )
          : ListView.builder(
              itemCount: db.todoList.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: db.todoList[index][0],
                  taskCompleted: db.todoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunc: (context) => deleteTask(index),
                );
              },
            ),
    );
  }
}
