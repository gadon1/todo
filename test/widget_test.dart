// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/widgets/to_do_tile.dart';
import '../lib/main.dart';

void main() {
  testWidgets('ToDo App', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that to do list is empty.
    expect(find.byType(Checkbox), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that new item add in edit mode
    expect(find.byType(Checkbox), findsNothing);
    expect(find.byType(TextFormField), findsOneWidget);

    // Set item title
    await tester.enterText(find.byType(TextFormField), "to do something");
    await tester.tap(find.byIcon(Icons.check));
    await tester.pump();

    //Verify new item is not in edit mode
    expect(find.byType(Checkbox), findsOneWidget);

    //Verify new item got title
    expect(find.text("to do something"), findsOneWidget);

    //Verify item not checked
    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, false);

    //Check item
    await tester.tap(find.byType(Checkbox));
    //Waiting for snackbar to go
    await tester.pumpAndSettle(Duration(seconds: 3));

    //Verify item is checked
    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, true);

    //Dismiss item
    await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));
    //Waiting for snackbar to go
    await tester.pumpAndSettle(Duration(seconds: 3));

    //Verifiy item removed
    expect(find.byType(Checkbox), findsNothing);
    expect(find.text("to do something"), findsNothing);
  });
}
