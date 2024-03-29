import 'package:flutter/material.dart';

class TraderPage extends StatelessWidget {
  const TraderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trader'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          padding: const EdgeInsets.all(16.0),
          children: [
            buildSquareButton(
                context, "Bidding", '/trader/bidding', Colors.blue),
            buildSquareButton(
                context, "Winners", '/trader/winners', Colors.green),
            buildSquareButton(
                context, "Bid History", '/trader/bidHistory', Colors.orange),
            buildSquareButton(context, "Bill Generate", '/trader/billGenerate',
                Colors.purple),
            buildSquareButton(
                context, "Gate Entry", '/trader/gateEntry', Colors.red),
            buildSquareButton(context, "Logout", '/logout', Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget buildSquareButton(
      BuildContext context, String text, String route, Color color) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        primary: color, // Set button background color
        onPrimary: Colors.white, // Set text color to white
        fixedSize: const Size(120.0, 120.0), // Set fixed dimensions
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.all(8.0),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
    );
  }
}
