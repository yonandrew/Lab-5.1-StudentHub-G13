import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab5/main.dart';

void main() {
  testWidgets('StudentHub opens on Home and switches to Students', (
    tester,
  ) async {
    await tester.pumpWidget(const StudentHubApp());

    Finder appBarText(String text) =>
        find.descendant(of: find.byType(AppBar), matching: find.text(text));

    expect(appBarText('Home'), findsOneWidget);

    // Works with the temporary "Tab 2" button (Part 1) and with the real
    // NavigationBar (after Part 8 is merged).
    final realTab = find.descendant(
      of: find.byType(NavigationBar),
      matching: find.text('Students'),
    );
    await tester.tap(
      realTab.evaluate().isNotEmpty ? realTab : find.text('Tab 2'),
    );
    await tester.pumpAndSettle();

    expect(appBarText('Students'), findsOneWidget);
  });
}
