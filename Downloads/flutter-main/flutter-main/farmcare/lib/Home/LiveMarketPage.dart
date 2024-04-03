
import 'package:farmcare/Home/HomePage.dart';
import 'package:flutter/material.dart';

class LiveMarketPage extends StatefulWidget {
  const LiveMarketPage({super.key});

  @override
  State createState() => _LiveMarketPageState();
}

class _LiveMarketPageState extends State {
   Widget card(int index) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 200,
        width: 500,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 82, 231, 87),
              Color.fromARGB(255, 146, 233, 148),
              Color.fromARGB(255, 227, 230, 227)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Product:- ${product[index]['Product']}',
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 40.0,
                    right: 10,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text('Avg Price'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 40.0,
                    right: 10,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text('Min Price'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 40.0,
                    right: 10,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text('Max Price'),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 36, right: 10),
                  child: Text(
                    '${product[index]['AvgPrice']}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 36, right: 10),
                  child: Text(
                    '${product[index]['MinPrice']}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 36, right: 10),
                  child: Text(
                    '${product[index]['MaxPrice']}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Live Market'),
        ),
        body: ListView.builder(
            itemCount: product.length,
            itemBuilder: (context, index) {
              return card(index);
            }));
  }
}
