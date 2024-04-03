// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.green, // Set app bar background color
      ),
      backgroundColor: Colors.white, // Set page background color
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Contact Information'),
              _buildClickableContactInfo('Email', 'apmc.help@gmail.com',
                  'mailto:bhagyashreetech@gmail.com'),
              _buildClickableContactInfo(
                  'Phone', '9309577322', 'tel:+919309577322'),
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
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
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
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildClickableContactInfo(String label, String value, String link) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          _launchURL(link); // Launch URL when tapped
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
