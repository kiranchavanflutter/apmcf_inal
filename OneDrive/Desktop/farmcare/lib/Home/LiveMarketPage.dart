import 'package:flutter/material.dart';

class LiveMarketPage extends StatelessWidget {
  LiveMarketPage({super.key});
  final String currentDate = 'January 6, 2024'; // Replace with actual date
  final List<Map<String, String>> marketData = [
    {
      'srNo': '1',
      'product': 'Apples',
      'avgPrice': '2.50',
      'requirements': '1000',
    },
    {
      'srNo': '2',
      'product': 'Bananas',
      'avgPrice': '1.50',
      'requirements': '800',
    },
    {
      'srNo': '3',
      'product': 'Tomatoes',
      'avgPrice': '3.00',
      'requirements': '1200',
    },
    {
      'srNo': '4',
      'product': 'Apples',
      'avgPrice': '2.50',
      'requirements': '1000',
    },
    {
      'srNo': '5',
      'product': 'Bananas',
      'avgPrice': '1.50',
      'requirements': '800',
    },
    {
      'srNo': '6',
      'product': 'Tomatoes',
      'avgPrice': '3.00',
      'requirements': '1200',
    },
    {
      'srNo': '7',
      'product': 'Apples',
      'avgPrice': '2.50',
      'requirements': '1000',
    },
    {
      'srNo': '8',
      'product': 'Bananas',
      'avgPrice': '1.50',
      'requirements': '800',
    },
    {
      'srNo': '9',
      'product': 'Tomatoes',
      'avgPrice': '3.00',
      'requirements': '1200',
    },
    {
      'srNo': '10',
      'product': 'Tomatoes',
      'avgPrice': '3.00',
      'requirements': '1200',
    },
    // Add more market data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Market'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: $currentDate',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 3,
              child: Container(
                height: 300, // Set a fixed height
                child: SingleChildScrollView(
                  child: DataTable(
                    columnSpacing: 15,
                    dataRowHeight: 60, // Adjust as needed
                    columns: const [
                      DataColumn(label: Text('Sr. No')),
                      DataColumn(label: Text('Product')),
                      DataColumn(label: Text('Avg Price'), numeric: true),
                      DataColumn(label: Text('Requirements'), numeric: true),
                    ],
                    rows: marketData.map<DataRow>((data) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(data['srNo'] ?? ''),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 8),
                                  Text(data['product'] ?? ''),
                                ],
                              ),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(data['avgPrice'] ?? ''),
                              ),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(data['requirements'] ?? ''),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
