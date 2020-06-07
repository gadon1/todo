import 'package:flutter/material.dart';
import 'package:slim/slim.dart';
import '../slims/to_do_list.dart';
import '../slims/to_do_item.dart';
import '../widgets/to_do_tile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Todo TDD"),
        ),
        body: SlimBuilder<ToDoList>(
          builder: (toDoList) => ListView.builder(
            itemCount: toDoList.items.length,
            itemBuilder: (context, index) => Slim<ToDoItem>(
              stateObject: toDoList.items[index],
              child: ToDoTile(),
            ),
            key: Key("${DateTime.now().microsecondsSinceEpoch}"),
          ),
        ),
        floatingActionButton: SlimBuilder<ToDoList>(
          builder: (toDoList) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: toDoList.addItem,
          ),
        ),
      );
}
