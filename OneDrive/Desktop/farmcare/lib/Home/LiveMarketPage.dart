import 'package:flutter/material.dart';

class LiveMarketPage extends StatelessWidget {
  LiveMarketPage({super.key});
  final String currentDate = 'January 6, 2024'; // Replace with actual date
  final List<Map<String, String>> marketData = [
    {'product': 'Apples', 'avgPrice': '2.50', 'requirements': '1000'},
    {'product': 'Apples', 'avgPrice': '2.50', 'requirements': '1000'},
    {'product': 'Bananas', 'avgPrice': '1.50', 'requirements': '800'},
    {'product': 'Tomatoes', 'avgPrice': '3.00', 'requirements': '1200'},

    // Add more market data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Market'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date: $currentDate',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              _buildMarketTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMarketTable() {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Product')),
        DataColumn(label: Text('Avg Price')),
        DataColumn(label: Text('Requirements')),
      ],
      rows: marketData.map<DataRow>((data) {
        return DataRow(
          cells: [
            DataCell(Text(data['product'] ?? '')),
            DataCell(Text(data['avgPrice'] ?? '')),
            DataCell(Text(data['requirements'] ?? '')),
          ],
        );
      }).toList(),
    );
  }
}
