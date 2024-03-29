import 'package:flutter/material.dart';
import 'BidPage.dart';

class BidHistoryPage extends StatefulWidget {
  @override
  _BidHistoryPageState createState() => _BidHistoryPageState();
}

class _BidHistoryPageState extends State<BidHistoryPage> {
  DateTime? fromDate;
  DateTime? toDate;
  List<Map<String, dynamic>> bidHistoryData = [
    {
      'productName': 'Apples',
      'lotCode': 'LC123',
      'price': 500.0,
      'date': DateTime(2024, 1, 10)
    },
    {
      'productName': 'Bananas',
      'lotCode': 'LC456',
      'price': 700.0,
      'date': DateTime(2024, 1, 12)
    },
    {
      'productName': 'Tomatoes',
      'lotCode': 'LC789',
      'price': 600.0,
      'date': DateTime(2024, 1, 15)
    },
    // Add more sample data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bid History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateRangeSelector("From Date", fromDate,
                (date) => setState(() => fromDate = date)),
            _buildDateRangeSelector(
                "To Date", toDate, (date) => setState(() => toDate = date)),
            SizedBox(height: 16.0),
            _buildBidHistoryList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateRangeSelector(
      String label, DateTime? date, Function(DateTime) onDateChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: date ?? DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2101),
          );
          if (picked != null && picked != date) {
            onDateChanged(picked);
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                date != null
                    ? "${date.toLocal()}".split(' ')[0]
                    : "Select Date",
              ),
              Icon(Icons.calendar_today),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBidHistoryList() {
    final filteredBids = bidHistoryData.where((bid) {
      if (fromDate != null && bid['date'].isBefore(fromDate!)) {
        return false;
      }
      if (toDate != null && bid['date'].isAfter(toDate!)) {
        return false;
      }
      return true;
    }).toList();

    return Expanded(
      child: ListView.builder(
        itemCount: filteredBids.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                '${filteredBids[index]['productName']} - ${filteredBids[index]['lotCode']}'),
            subtitle: Text(
                'Price: ${filteredBids[index]['price']} | Date: ${filteredBids[index]['date']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BidPage(bidDetails: filteredBids[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
