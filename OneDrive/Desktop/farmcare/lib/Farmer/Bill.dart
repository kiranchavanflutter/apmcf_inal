import 'package:flutter/material.dart';

class Bill {
  final String productName;
  final double price;
  final DateTime date;

  Bill({required this.productName, required this.price, required this.date});
}

class BillsPage extends StatefulWidget {
  @override
  _BillsPageState createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage> {
  DateTime selectedDate = DateTime.now();

  List<Bill> bills = [
    Bill(
        productName: 'Product 1',
        price: 100.0,
        date: DateTime.now().subtract(const Duration(days: 2))),
    Bill(
        productName: 'Product 2',
        price: 150.0,
        date: DateTime.now().subtract(const Duration(days: 1))),
    // Add more bills as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bills'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search by Date:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select Date'),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Bills:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            buildBillList(),
          ],
        ),
      ),
    );
  }

  Widget buildBillList() {
    return Expanded(
      child: ListView.builder(
        itemCount: bills.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Product: ${bills[index].productName}'),
            subtitle: Text('Price: \$${bills[index].price.toString()}'),
            trailing: ElevatedButton(
              onPressed: () => _viewBillDetails(context, bills[index]),
              child: const Text('View'),
            ),
          );
        },
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        // Implement filtering bills by selected date
      });
    }
  }

  void _viewBillDetails(BuildContext context, Bill bill) {
    // Implement navigating to the BillDetailsPage with the selected bill
    // You can pass the 'bill' object to the BillDetailsPage for detailed view
  }
}
