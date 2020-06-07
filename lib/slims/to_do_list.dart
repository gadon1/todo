import 'package:flutter/material.dart';
import 'package:slim/slim.dart';
import 'to_do_item.dart';

class ToDoList extends SlimObject {
  List<ToDoItem> items = [];

  void addItem() {
    items.add(ToDoItem(""));
    updateUI();
  }

  void deleteItem(ToDoItem item) {
    items.remove(item);
    showSnackBar("task: ${item.title} deleted",
        messageBackgroundColor: Colors.red);
  }
}
