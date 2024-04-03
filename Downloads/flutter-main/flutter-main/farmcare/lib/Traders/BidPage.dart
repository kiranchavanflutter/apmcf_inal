import 'package:flutter/material.dart';

class BidPage extends StatelessWidget {
  final Map<String, dynamic> bidDetails;

  BidPage({required this.bidDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bid Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Name: ${bidDetails['productName']}'),
            Text('Lot Code: ${bidDetails['lotCode']}'),
            Text('Price: ${bidDetails['price']}'),
            Text('Date: ${bidDetails['date']}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
