import 'package:flutter/material.dart';

class LotStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lot Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search Lot Code:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter lot code',
              ),
            ),
            SizedBox(height: 16.0),
            buildStatusRow('Lot Code', true),
            buildStatusRow('Weight Check', true),
            buildStatusRow('Sample Collect', false),
            buildStatusRow('Approval', true),
            buildStatusRow('Bid Created', true),
            buildStatusRow('Bid Status', 'Closed'),
            buildStatusRow(
                'Bid Amount', '\$5000'), // Change this to the actual bid amount
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add your logic for proceeding to bill
                _proceedToBill(context);
              },
              child: Text('Proceed to Bill'),
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
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              style: TextStyle(fontSize: 16),
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
          title: Text('Sample Bill'),
          content: Column(
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
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
