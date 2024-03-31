// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LotStatusPage extends StatelessWidget {
  const LotStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lot Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search Lot Code:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter lot code',
              ),
            ),
            const SizedBox(height: 16.0),
            buildStatusRow('Lot Code', true),
            buildStatusRow('Weight Check', true),
            buildStatusRow('Sample Collect', false),
            buildStatusRow('Approval', true),
            buildStatusRow('Bid Created', true),
            buildStatusRow('Bid Status', 'Closed'),
            buildStatusRow(
                'Bid Amount', '\$5000'), // Change this to the actual bid amount
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add your logic for proceeding to bill
                _proceedToBill(context);
              },
              child: const Text('Proceed to Bill'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatusRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (value is bool)
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                // Handle checkbox change
              },
            ),
          if (value is String)
            Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
        ],
      ),
    );
  }

  void _proceedToBill(BuildContext context) {
    // Add your logic for proceeding to bill
    // This method will be called when the "Proceed to Bill" button is pressed
    // You can navigate to the bill page or show a sample bill
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sample Bill'),
          content: const Column(
            children: [
              // Display your sample bill content here
              // Include trader name, farmer name, date, bill no, products, quantity, rate, etc.
              // Add signature spaces for farmer and trader
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
