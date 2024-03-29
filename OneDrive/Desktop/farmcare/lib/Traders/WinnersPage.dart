import 'package:flutter/material.dart';

class WinnersPage extends StatefulWidget {
  @override
  _WinnersPageState createState() => _WinnersPageState();
}

class _WinnersPageState extends State<WinnersPage> {
  DateTime? selectedDate;
  List<Map<String, dynamic>> winnersData = [
    {
      'traderId': 1,
      'traderName': 'John Doe',
      'lotCode': 'LC123',
      'bidPrice': 500.0,
      'date': DateTime(2024, 1, 10)
    },
    {
      'traderId': 2,
      'traderName': 'Jane Smith',
      'lotCode': 'LC456',
      'bidPrice': 700.0,
      'date': DateTime(2024, 1, 10)
    },
    {
      'traderId': 3,
      'traderName': 'Bob Johnson',
      'lotCode': 'LC789',
      'bidPrice': 600.0,
      'date': DateTime(2024, 1, 12)
    },
    {
      'traderId': 3,
      'traderName': 'Bob Johnson',
      'lotCode': 'LC789',
      'bidPrice': 600.0,
      'date': DateTime(2024, 1, 12)
    },
    // Add more sample data as needed
  ];

  List<Map<String, dynamic>> filteredWinners = [];

  @override
  void initState() {
    super.initState();
    filteredWinners = List.from(winnersData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Winners'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateField(
                "Select Date", selectedDate, () => _selectDate(context)),
            const SizedBox(height: 5.0),
            _buildWinnersTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField(String label, DateTime? date, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: onTap,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                date != null
                    ? "${date.toLocal()}".split(' ')[0]
                    : "Select Date",
              ),
              const Icon(Icons.calendar_today),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _filterWinnersByDate();
      });
    }
  }

  void _filterWinnersByDate() {
    if (selectedDate != null) {
      filteredWinners = winnersData
          .where((winner) =>
              winner['date'].year == selectedDate!.year &&
              winner['date'].month == selectedDate!.month &&
              winner['date'].day == selectedDate!.day)
          .toList();
    } else {
      filteredWinners = List.from(winnersData);
    }
  }

  Widget _buildWinnersTable() {
    return DataTable(
      columns: [
        const DataColumn(label: Text('Trader ID')),
        const DataColumn(label: const Text('Trader Name')),
        const DataColumn(label: Text('Lot Code')),
        const DataColumn(label: Text('Bid Price')),
        const DataColumn(label: Text('Date')),
      ],
      rows: filteredWinners.map<DataRow>((data) {
        return DataRow(
          cells: [
            DataCell(Text(data['traderId'].toString())),
            DataCell(Text(data['traderName'].toString())),
            DataCell(Text(data['lotCode'].toString())),
            DataCell(Text(data['bidPrice'].toString())),
            DataCell(Text(data['date'].toString().split(' ')[0])),
          ],
        );
      }).toList(),
    );
  }
}
