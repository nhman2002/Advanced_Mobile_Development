import 'package:flutter/material.dart';

class OfferListPage extends StatelessWidget {
  final List<Map<String, String>> offers = [
    {'projectName': 'Project A', 'companyName': 'Company X'},
    {'projectName': 'Project B', 'companyName': 'Company Y'},
    {'projectName': 'Project C', 'companyName': 'Company Z'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offer List'),
      ),
      body: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];
          return OfferItem(
            projectName: offer['projectName']!,
            companyName: offer['companyName']!,
          );
        },
      ),
    );
  }
}

class OfferItem extends StatelessWidget {
  final String projectName;
  final String companyName;

  const OfferItem({
    required this.projectName,
    required this.companyName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project: $projectName',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Company: $companyName',
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle accept button press
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: Text('Accept'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle reject button press
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Text('Reject'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
