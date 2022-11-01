import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {

  List todoList = [

  ];
  // reference our box
  final _myBox = Hive.box('mybox');

  //run this method if this is the 1st time ever openning this app

  void createInitData() {
    todoList = [
      ['Swipe left to delete', false],
      ['Trượt sang trái để xóa', false],
    ];
  }
    // load the data from database
    void loadData() {
      todoList = _myBox.get("TODOLIST");
    }

    // updata the database
    void updateDatabase() {
      _myBox.put("TODOLIST", todoList);

  }
}