import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact Us'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Contact Information'),
                _buildContactInfo('Email', 'bhagyashreetech@gmail.com'),
                _buildContactInfo('Phone', '9309577322'),
                const SizedBox(height: 16.0),
                _buildSectionTitle('Address Information'),
                _buildContactInfo('Kaveri Hostel', 'Sinhgad College Road'),
                _buildContactInfo('ambegaon', 'Pune, Maharastra, 411041'),
                const SizedBox(height: 16.0),
                _buildSectionTitle('Working Hours'),
                _buildContactInfo('Monday - Friday', '9:00 AM - 5:00 PM'),
                _buildContactInfo('Saturday', '10:00 AM - 2:00 PM'),
              ],
            ),
          ),
        ));
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildContactInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
