import 'package:farmcare/Home/FarmerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Farmer Page UI Test', (WidgetTester tester) async {
    // Build the FarmerPage widget
    await tester.pumpWidget(const MaterialApp(
      home: FarmerPage(),
    ));

    // Verify that the app bar title is correct
    expect(find.text('Farmer'), findsOneWidget);

    // Verify that the expected buttons are displayed
    expect(find.text('Lot'), findsOneWidget);
    expect(find.text('Lot Status'), findsOneWidget);
    expect(find.text('Lot History'), findsOneWidget);
    expect(find.text('Bills'), findsOneWidget);
    expect(find.text('Gate Entry'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);

    // Verify that tapping on a button navigates to the correct route
    await tester.tap(find.text('Lot'));
    await tester.pumpAndSettle(); // Wait for any animations to complete
    expect(find.text('Lot Page'),
        findsOneWidget); // Assuming '/farmer/lot' route leads to a page with title 'Lot Page'
  });
}
