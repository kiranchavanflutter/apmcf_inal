import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:farmcare/Home/HomePage.dart'; // Adjust the import path as necessary

void main() {
  testWidgets('HomePage UI Test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
        //home: HomePage(),
        ));

    // Verify that the title is displayed.
    expect(find.text('APMC System'), findsOneWidget);

    // Verify that all buttons are present.
    expect(find.byType(ElevatedButton), findsNWidgets(7));

    // Add more test cases as needed to validate UI elements and functionality.
  });
}
