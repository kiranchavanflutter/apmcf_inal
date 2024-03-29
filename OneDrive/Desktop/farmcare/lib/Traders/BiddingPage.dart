import 'package:flutter/material.dart'
    show
        AlertDialog,
        AppBar,
        BuildContext,
        Colors,
        Column,
        CrossAxisAlignment,
        EdgeInsets,
        ElevatedButton,
        Icon,
        Icons,
        InkWell,
        InputDecoration,
        InputDecorator,
        MainAxisAlignment,
        Navigator,
        OutlineInputBorder,
        Padding,
        Row,
        Scaffold,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextEditingController,
        TextField,
        VoidCallback,
        Widget,
        showDatePicker,
        showDialog;

class BiddingPage extends StatefulWidget {
  const BiddingPage({super.key});
  @override
  _BiddingPageState createState() => _BiddingPageState();
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField("Product Name", productNameController),
            _buildTextField("Lot Code", lotCodeController),
            _buildTextField("Trader Name", traderNameController),
            _buildDateField(
                "Start Date", startDate, () => _selectStartDate(context)),
            _buildDateField("End Date", endDate, () => _selectEndDate(context)),
            _buildTextField("Bid Price", bidPriceController),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                _submitBid(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Submit Bid'),
            ),
          ],
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
          border: OutlineInputBorder(),
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

  void _submitBid(BuildContext context) {
    String productName = productNameController.text;
    String lotCode = lotCodeController.text;
    String traderName = traderNameController.text;
    String startDateString =
        startDate != null ? startDate!.toLocal().toString() : "";
    String endDateString = endDate != null ? endDate!.toLocal().toString() : "";
    double bidPrice = double.tryParse(bidPriceController.text) ?? 0.0;

    // Handle the submitted bid data as needed, e.g., send it to a server
    print('Submitted Bid:');
    print('Product Name: $productName');
    print('Lot Code: $lotCode');
    print('Trader Name: $traderName');
    print('Start Date: $startDateString');
    print('End Date: $endDateString');
    print('Bid Price: $bidPrice');

    // Show a dialog box
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bid Submitted Successfully'),
          content: Text('Thank you for submitting your bid.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
