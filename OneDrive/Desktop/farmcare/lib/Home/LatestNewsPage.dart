// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class LatestNewsPage extends StatelessWidget {
  final List<Map<String, String>> newsList = [
    {
      'title':
          'Minister warns mills against cheating farmers while weighing sugarcane',
      'description':
          'Growers should get their sugarcane weighed at APMC for free and get a receipt. That load should again be weighed at the sugar mills. If there is any discrepancy in the weight of the produce, they should give a written complaint against the mills. We will examine it and cancel the licence of mills if the latter are found guilty. The problem is that farmers often don’t come forward to give complaints,” Mr. Patil told media representatives in Kalaburagi on Wednesday',
    },
    {
      'title':
          'Minister warns mills against cheating farmers while weighing sugarcane',
      'description':
          'Growers should get their sugarcane weighed at APMC for free and get a receipt. That load should again be weighed at the sugar mills. If there is any discrepancy in the weight of the produce, they should give a written complaint against the mills. We will examine it and cancel the licence of mills if the latter are found guilty. The problem is that farmers often don’t come forward to give complaints,” Mr. Patil told media representatives in Kalaburagi on Wednesday',
    },
    {
      'title':
          'Minister warns mills against cheating farmers while weighing sugarcane',
      'description':
          'Growers should get their sugarcane weighed at APMC for free and get a receipt. That load should again be weighed at the sugar mills. If there is any discrepancy in the weight of the produce, they should give a written complaint against the mills. We will examine it and cancel the licence of mills if the latter are found guilty. The problem is that farmers often don’t come forward to give complaints,” Mr. Patil told media representatives in Kalaburagi on Wednesday',
    },
  ];

  LatestNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest News'),
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return _buildNewsCard(context, newsList[index]);
        },
      ),
    );
  }

  Widget _buildNewsCard(BuildContext context, Map<String, String> news) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          _showNewsDetails(context, news);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      news['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const Icon(Icons.arrow_forward),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                news['description']!,
                style: const TextStyle(fontSize: 16),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showNewsDetails(BuildContext context, Map<String, String> news) {
    // Add logic to navigate to news details page or show full news
    // This function will be triggered when a news card is tapped
    // For demonstration purposes, let's print the news details
    print('Title: ${news['title']}');
    print('Description: ${news['description']}');
  }
}
