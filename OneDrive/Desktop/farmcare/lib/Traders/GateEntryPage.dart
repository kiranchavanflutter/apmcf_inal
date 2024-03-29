import 'package:flutter/material.dart';

class GateEntryPage extends StatefulWidget {
  @override
  _GateEntryPageState createState() => _GateEntryPageState();
}

class _GateEntryPageState extends State<GateEntryPage> {
  String traderId = '';
  String traderName = '';
  String vehicleNumber = '';
  String vehicleType = 'Tractor'; // Default value
  String reasonForEntry = 'Delivery'; // Default value
  List<String> selectedProducts = [];

  final TextEditingController traderIdController = TextEditingController();
  final TextEditingController traderNameController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();

  final List<String> vehicleTypes = [
    'Tractor',
    'Truck',
    'Auto',
    'Pickup',
    'Other'
  ];
  final List<String> reasonsForEntry = [
    'Delivery',
    'Pickup',
    'Meeting',
    'Service',
    'Other'
  ];
  final List<String> availableProducts = [
    'Product A',
    'Product B',
    'Product C',
    'Product D',
    'Product E'
  ];

  void _submitEntry() {
    // Logic to submit the gate entry
    _showDialog('Gate entry submitted successfully!');
  }

  void _resetFields() {
    setState(() {
      traderIdController.clear();
      traderNameController.clear();
      vehicleNumberController.clear();
      vehicleType = 'Tractor';
      reasonForEntry = 'Delivery';
      selectedProducts.clear();
    });
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gate Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputRow('Trader ID', traderIdController),
            _buildInputRow('Trader Name', traderNameController),
            _buildInputRow('Vehicle Number', vehicleNumberController),
            SizedBox(height: 16.0),
            _buildDropdownRow('Vehicle Type', vehicleType, vehicleTypes),
            _buildDropdownRow(
                'Reason for Entry', reasonForEntry, reasonsForEntry),
            SizedBox(height: 16.0),
            _buildProductList(),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _submitEntry,
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: _resetFields,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputRow(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildDropdownRow(String label, String value, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        DropdownButton<String>(
          value: value,
          onChanged: (newValue) {
            setState(() {
              if (label == 'Vehicle Type') {
                vehicleType = newValue!;
              } else if (label == 'Reason for Entry') {
                reasonForEntry = newValue!;
              }
            });
          },
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildProductList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Products'),
        Wrap(
          spacing: 8.0,
          children: availableProducts.map((String productName) {
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedProducts.contains(productName)) {
                    selectedProducts.remove(productName);
                  } else {
                    selectedProducts.add(productName);
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: selectedProducts.contains(productName)
                    ? Colors.green
                    : null,
              ),
              child: Text(productName),
            );
          }).toList(),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
