import 'package:flutter/material.dart';
import 'package:slim/slim.dart';
import 'slims/to_do_list.dart';
import 'screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => [
        Slimer<ToDoList>(ToDoList()),
      ].slim(
        child: MaterialApp(
          builder: SlimMaterialAppBuilder.builder,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Home(),
        ),
      );
}
