import 'package:flutter/material.dart';

class AboutAPMCPage extends StatelessWidget {
  const AboutAPMCPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About APMC'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Agriculture Produce Marketing Committee (APMC) System!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'The APMC plays a crucial role in the marketing of agricultural produce, ensuring fair practices, and providing a platform for farmers and traders to engage in trade.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Our mission is to facilitate a transparent and efficient marketplace for agricultural commodities. The APMC System connects farmers with buyers, promotes fair pricing, and contributes to the overall development of the agricultural sector.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Through this platform, farmers can access real-time market information, connect with traders, and make informed decisions about selling their produce. Traders, on the other hand, can explore a diverse range of agricultural products and participate in fair trade practices.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Thank you for being a part of the APMC System. We are committed to supporting the agricultural community and fostering a sustainable and prosperous future for farmers and traders alike.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
