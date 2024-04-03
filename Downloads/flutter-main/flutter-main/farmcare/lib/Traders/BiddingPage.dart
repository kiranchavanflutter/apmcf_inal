import 'package:farmcare/DataBase/biddingdata.dart';
import 'package:flutter/material.dart';

class BiddingPage extends StatefulWidget {
  const BiddingPage({super.key});
  @override
  State createState() => _BiddingPageState();
}

class _BiddingPageState extends State<BiddingPage> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController lotCodeController = TextEditingController();
  final TextEditingController traderNameController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  final TextEditingController bidPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bidding'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("Product Name", productNameController),
              _buildTextField("Lot Code", lotCodeController),
              _buildTextField("Trader Name", traderNameController),
              _buildDateField(
                  "Start Date", startDate, () => _selectStartDate(context)),
              _buildDateField(
                  "End Date", endDate, () => _selectEndDate(context)),
              _buildTextField("Bid Price", bidPriceController),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  submitBid(context);
                  print(await getData());
                  productNameController.clear();
                  lotCodeController.clear();
                  traderNameController.clear();
                  bidPriceController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('Submit Bid'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDateField(String label, DateTime? date, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
      });
    }
  }

  List<BiddingDataBase> al = [];
  void submitBid(BuildContext context) async {
    String productName = productNameController.text;
    int lotCode = int.tryParse(lotCodeController.text) ?? 0;
    String traderName = traderNameController.text;
    String startDateString =
        startDate != null ? startDate!.toLocal().toString() : "";
    String endDateString = endDate != null ? endDate!.toLocal().toString() : "";
    num bidPrice = num.tryParse(bidPriceController.text) ?? 0.0;

    BiddingDataBase obj = BiddingDataBase(
      productName: productName,
      bidPrice: bidPrice,
      endDate: endDateString,
      lotCode: lotCode,
      startDate: startDateString,
      traderName: traderName,
    );

    await insertData(obj);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Bid Submitted Successfully'),
          content: const Text('Thank you for submitting your bid.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
