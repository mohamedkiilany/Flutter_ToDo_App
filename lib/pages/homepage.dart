import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/to_do_tile.dart';
import 'package:todo_app/util/dialog_box.dart';

// void main(){
//   runApp(const Homepage());
// }

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  tododatabase db = tododatabase();
  final _controller = TextEditingController();
  final _mybox = Hive.box("mybox");

  void checkboxchange(bool? value, int index) {
    setState(() {
      db.tasks[index][1] = !db.tasks[index][1];
      db.updateData();
    });
  }

  void savedNewTask() {
    setState(() {
      db.tasks.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
      db.updateData();
    });
  }

  void deleteTask(int index) {
    setState(() {
      db.tasks.removeAt(index);
      db.updateData();
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          mycontroller: _controller,
          oncancel: () => Navigator.pop(context),
          onsave: savedNewTask,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (_mybox.get("TASKS") == null) {
      db.initialData();
    } else {
      db.localData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 243, 222, 36),
          title: //Padding(
              // padding: const EdgeInsets.only(top: 25),
              Center(child: Text("ToDo App", style: TextStyle(fontSize: 25))),
          //),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: createNewTask,
        ),
        body: ListView.builder(
          itemCount: db.tasks.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              TaskCompleted: db.tasks[index][1],
              TaskName: db.tasks[index][0],
              OnChanged: (value) => checkboxchange(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ),
      ),
    );
  }
}
