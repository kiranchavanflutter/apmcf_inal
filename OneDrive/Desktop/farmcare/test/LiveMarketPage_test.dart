import 'package:farmcare/Home/LiveMarketPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Live Market Page UI Test', (WidgetTester tester) async {
    // Build the LiveMarketPage widget
    await tester.pumpWidget(MaterialApp(
      home: LiveMarketPage(),
    ));

    // Verify that the app bar title is correct
    expect(find.text('Live Market'), findsOneWidget);

    // Verify that the current date is displayed
    expect(find.text('Date: January 6, 2024'), findsOneWidget);

    // Verify that the market data table is displayed
    expect(find.byType(DataTable), findsOneWidget);

    // Verify that the correct number of rows are displayed in the table
    expect(find.byType(DataRow),
        findsNWidgets(10)); // Assuming there are 10 rows of market data

    // Verify that the data cells contain the expected text
    expect(find.text('1'),
        findsNWidgets(1)); // Assuming '1' appears in the market data
    expect(
        find.text('Apples'),
        findsNWidgets(
            3)); // Assuming 'Apples' appears 3 times in the market data
    expect(find.text('2.50'),
        findsNWidgets(3)); // Assuming '2.50' appears 3 times in the market data
    expect(find.text('1000'),
        findsNWidgets(3)); // Assuming '1000' appears 3 times in the market data
  });
}
