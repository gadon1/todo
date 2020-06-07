import 'package:flutter/material.dart';
import 'package:slim/slim.dart';
import '../slims/to_do_item.dart';
import '../slims/to_do_list.dart';
import 'dismiss_bkg.dart';

class ToDoTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = context.slim<ToDoList>();
    return Card(
      child: SlimBuilder<ToDoItem>(
        builder: (item) => item.editMode
            ? ListTile(
                title: TextFormField(
                  autofocus: true,
                  initialValue: item.title,
                  onChanged: item.setTitle,
                  onFieldSubmitted: (_) => item.toggleEdit(),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  onPressed: item.toggleEdit,
                ),
              )
            : Dismissible(
                background: DismissBkg(Alignment.topLeft),
                secondaryBackground: DismissBkg(Alignment.topRight),
                onDismissed: (_) => list.deleteItem(item),
                key: Key("${DateTime.now().microsecondsSinceEpoch}"),
                child: ListTile(
                  leading: Checkbox(
                    value: item.done,
                    onChanged: item.check,
                  ),
                  title: InkWell(
                    child: Text(item.title),
                    onTap: item.toggleEdit,
                  ),
                ),
              ),
      ),
    );
  }
}
