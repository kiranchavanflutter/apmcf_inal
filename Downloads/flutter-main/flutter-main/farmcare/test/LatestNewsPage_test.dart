import 'package:farmcare/Home/LatestNewsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Latest News Page UI Test', (WidgetTester tester) async {
    // Build the LatestNewsPage widget
    await tester.pumpWidget(MaterialApp(
      home: LatestNewsPage(),
    ));

    // Verify that the app bar title is correct
    expect(find.text('Latest News'), findsOneWidget);

    // Verify that the news cards are displayed
    expect(find.byType(Card),
        findsNWidgets(3)); // Assuming there are 3 news cards in the list

    // Tap on a news card and verify that the details are printed
    await tester.tap(find.byType(InkWell).first); // Tap on the first news card
    await tester.pumpAndSettle(); // Wait for any animations to complete
    expect(
        find.text(
            'Title: Minister warns mills against cheating farmers while weighing sugarcane'),
        findsOneWidget); // Verify that the title of the tapped news is printed
    expect(
        find.text(
            'Description: Growers should get their sugarcane weighed at APMC for free and get a receipt. That load should again be weighed at the sugar mills. If there is any discrepancy in the weight of the produce, they should give a written complaint against the mills. We will examine it and cancel the licence of mills if the latter are found guilty. The problem is that farmers often don’t come forward to give complaints,” Mr. Patil told media representatives in Kalaburagi on Wednesday'),
        findsOneWidget); // Verify that the description of the tapped news is printed
  });
}
