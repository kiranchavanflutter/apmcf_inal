/*import 'package:flutter/material.dart';

class FarmerGateEntryPage extends StatefulWidget {
  const FarmerGateEntryPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GateEntryPageState createState() => _GateEntryPageState();
}

class _GateEntryPageState extends State<FarmerGateEntryPage> {
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
          title: const Text('Message'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
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
        title: const Text('Gate Entry'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputRow('Trader ID', traderIdController),
            _buildInputRow('Trader Name', traderNameController),
            _buildInputRow('Vehicle Number', vehicleNumberController),
            const SizedBox(height: 16.0),
            _buildDropdownRow('Vehicle Type', vehicleType, vehicleTypes),
            _buildDropdownRow(
                'Reason for Entry', reasonForEntry, reasonsForEntry),
            const SizedBox(height: 16.0),
            _buildProductList(),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _submitEntry,
                  child: const Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: _resetFields,
                  child: const Text('Reset'),
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
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          ),
        ),
        const SizedBox(height: 16.0),
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
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildProductList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Products'),
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
                backgroundColor: selectedProducts.contains(productName)
                    ? Colors.green
                    : null,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              ),
              child: Text(productName),
            );
          }).toList(),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:farmcare/DataBase/gateEntry.dart';

class GateEntryPage extends StatefulWidget {
  const GateEntryPage({super.key});

  @override
  State createState() => _GateEntryPageState();
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
  final TextEditingController farmerNameController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
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

  void _submitEntry() async {
    // Logic to submit the gate entry
    GateEntryDataBase obj = GateEntryDataBase(
        farmerName: farmerNameController.text,
        productName: productNameController.text,
        traderId: int.tryParse(traderIdController.text) ?? 0,
        traderName: traderNameController.text,
        vehicleNumber: vehicleNumberController.text,
        vehicleType: vehicleType);

    await insertData(obj);
    Future<List<GateEntryDataBase>> getData() async {
      final localDB = await gateentrydatabase;
      List<Map<String, dynamic>> mapEntry =
          await localDB.query("gateEntryTable");

      return List.generate(mapEntry.length, (i) {
        setState(() {});
        return GateEntryDataBase(
            farmerName: farmerNameController.text,
            productName: productNameController.text,
            traderId: int.tryParse(traderId) ?? 0,
            traderName: traderName,
            vehicleNumber: vehicleNumber,
            vehicleType: vehicleType);
      });
    }

    print('.....................................');
    print(await getData());
    print('.....................................');
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
          title: const Text('Message'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
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
        title: const Text('Gate Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputRow('Trader ID', traderIdController),
            _buildInputRow('Trader Name', traderNameController),
            _buildInputRow('Farmer Name', farmerNameController),
            _buildInputRow('Product Name', productNameController),
            _buildInputRow('Vehicle Number', vehicleNumberController),
            const SizedBox(height: 16.0),
            _buildDropdownRow('Vehicle Type', vehicleType, vehicleTypes),
            _buildDropdownRow(
                'Reason for Entry', reasonForEntry, reasonsForEntry),
            const SizedBox(height: 16.0),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _submitEntry,
                  child: const Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: _resetFields,
                  child: const Text('Reset'),
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
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
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
        const SizedBox(height: 16.0),
      ],
    );
  }
}
