import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/pages/to_do-tile.dart';
import 'package:to_do/utils/dia_log_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //refenrence the hive box
  final _myBox = Hive.box('mybox');

  @override
  void initState() {
    // TODO: implement initState
    //if this is method 1st time ever openning the app, then crate default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitData();
    }
    else {
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  //list to do task
  ToDoDataBase db = ToDoDataBase();

  //check box was tapped
  void checkBoxChange(bool? value,int index) {
    setState(() {
      db.todoList[index][1] =!db.todoList[index][1];
    });
    db.updateDatabase();
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }
  // create a new task
  void createNewTask () {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCacel: () => Navigator.of(context).pop()
        );
        },
      );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text('TO DO - Haii',style: TextStyle(fontWeight: FontWeight.bold),)),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          createNewTask();
        },
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
              taskName: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value) => checkBoxChange(value, index),
              deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
