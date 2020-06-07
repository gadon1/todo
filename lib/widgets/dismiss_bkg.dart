import 'package:flutter/material.dart';

class DismissBkg extends StatelessWidget {
  final Alignment alignment;
  DismissBkg(this.alignment);
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.red,
        alignment: alignment,
        child: Container(
          alignment: Alignment.center,
          child: Icon(
            Icons.delete_outline,
            color: Colors.white,
          ),
          width: 50,
        ),
      );
}
