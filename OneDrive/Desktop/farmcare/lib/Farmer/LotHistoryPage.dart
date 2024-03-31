import 'package:flutter/material.dart';

class LotHistoryPage extends StatefulWidget {
  const LotHistoryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LotHistoryPageState createState() => _LotHistoryPageState();
}

class _LotHistoryPageState extends State<LotHistoryPage> {
  DateTime selectedFromDate = DateTime.now();
  DateTime selectedToDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lot History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search by Date:',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(context, true),
                  child: const Text('From Date'),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () => _selectDate(context, false),
                  child: const Text('To Date'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Lot History:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            buildLotHistoryEntry('Trader 1', 'Lot 123', '\$5000'),
            buildLotHistoryEntry('Trader 2', 'Lot 456', '\$7000'),
            // Add more lot history entries as needed
          ],
        ),
      ),
    );
  }

  Widget buildLotHistoryEntry(
      String traderName, String lotNumber, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Trader: $traderName',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'Lot: $lotNumber',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'Price: $price',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isFromDate ? selectedFromDate : selectedToDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null &&
        pickedDate != (isFromDate ? selectedFromDate : selectedToDate)) {
      setState(() {
        if (isFromDate) {
          selectedFromDate = pickedDate;
        } else {
          selectedToDate = pickedDate;
        }
      });
    }
  }
}
