import 'package:flutter/material.dart';
import 'package:slim/slim.dart';

class ToDoItem extends SlimObject {
  String title;
  bool done;
  bool editMode = true;
  ToDoItem(this.title, {this.done = false});

  void check(bool value) {
    if (done == value) return;
    done = value;
    updateUI();
    if (done)
      showSnackBar("$title is done!",
          messageBackgroundColor: Colors.blueAccent);
  }

  void setTitle(String title) => this.title = title;

  void toggleEdit() {
    editMode = !editMode;
    updateUI();
  }
}
