// ignore_for_file: file_names

import 'package:farmcare/DataBase/farmerbill.dart';
import 'package:flutter/material.dart';

List pr = [];

class FarmerPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const FarmerPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          padding: const EdgeInsets.all(16.0),
          children: [
            buildSquareButton(context, "Lot", '/farmer/lot', Colors.blue),
            buildSquareButton(
                context, "Lot Status", '/farmer/lotStatus', Colors.green),
            buildSquareButton(
                context, "Lot History", '/farmer/lotHistory', Colors.orange),
            buildSquareButton(context, "Bills", '/farmer/bills', Colors.purple),
            buildSquareButton(
                context, "Gate Entry", '/farmer/gateEntry', Colors.red),
            buildSquareButton(context, "Logout", '/', Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget buildSquareButton(
      BuildContext context, String text, String route, Color color) {
    return ElevatedButton(
      onPressed: () async {
        pr = [];
        if (text == 'Bills') {
          List<FarmerBillDataBase> list = await getData();

          for (int i = 0; i < list.length; i++) {
            String productName = list[i].product;
            pr.add(productName);
          }
        }
        print(pr);
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: color, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
