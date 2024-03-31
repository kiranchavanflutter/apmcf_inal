import 'package:flutter/material.dart';

class LotPage extends StatefulWidget {
  const LotPage({Key? key}) : super(key: key);

  @override
  _LotPageState createState() => _LotPageState();
}

class _LotPageState extends State<LotPage> {
  String? selectedProduct; // Change to nullable
  String? selectedBagType; // Change to nullable
  DateTime selectedDate = DateTime.now();
  TextEditingController lotCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lot Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Lot Code:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: lotCodeController,
                decoration: const InputDecoration(
                  hintText: 'Enter lot code',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Lot Date:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ), // Text color set to white
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
                child: const Text(
                  'Select Date',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Selected Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Products:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              buildDropdown(products, selectedProduct),
              const SizedBox(height: 16.0),
              const Text(
                'Bag Type:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              buildDropdown(bagTypes, selectedBagType),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _proceedToBid();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ), // Text color set to white
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
                child: const Text(
                  'Proceed to Bid',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                  height:
                      200.0), // Added some additional space to test overflow
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(List<String> items, String? selectedItem) {
    return DropdownButton<String>(
      value: selectedItem,
      onChanged: (String? newValue) {
        setState(() {
          selectedProduct = newValue;
        });
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      style: const TextStyle(fontSize: 16),
      underline: Container(
        height: 2,
        color: Colors.green,
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
      });
    }
  }

  void _proceedToBid() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Proceed to Bid'),
          content: const Text(
            'Your lot information has been submitted for bidding.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

List<String> products = ['Product A', 'Product B', 'Product C'];
List<String> bagTypes = ['30kg', '40kg', '50kg'];
