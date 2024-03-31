import 'package:farmcare/Home/TraderPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Trader Page UI Test', (WidgetTester tester) async {
    // Build the TraderPage widget
    await tester.pumpWidget(const MaterialApp(
      home: TraderPage(),
    ));

    // Verify that the app bar title is correct
    expect(find.text('Trader'), findsOneWidget);

    // Verify that all the buttons are displayed
    expect(find.text('Bidding'), findsOneWidget);
    expect(find.text('Winners'), findsOneWidget);
    expect(find.text('Bid History'), findsOneWidget);
    expect(find.text('Bill Generate'), findsOneWidget);
    expect(find.text('Gate Entry'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });

  testWidgets('Trader Page Button Navigation Test',
      (WidgetTester tester) async {
    // Build the TraderPage widget
    await tester.pumpWidget(const MaterialApp(
      home: TraderPage(),
    ));

    // Tap on the 'Bidding' button and verify navigation
    await tester.tap(find.text('Bidding'));
    await tester.pumpAndSettle(); // Wait for navigation to complete
    expect(find.text('/trader/bidding'),
        findsOneWidget); // Assuming '/trader/bidding' is the expected route

    // Tap on the 'Winners' button and verify navigation
    await tester.tap(find.text('Winners'));
    await tester.pumpAndSettle(); // Wait for navigation to complete
    expect(find.text('/trader/winners'),
        findsOneWidget); // Assuming '/trader/winners' is the expected route

    // Add similar tests for other buttons
  });
}
