import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OfferDetail extends StatefulWidget {
  final String projectName;
  final String companyName;

  const OfferDetail({super.key, 
    required this.projectName,
    required this.companyName,
  });

  @override
  _OfferDetailState createState() => _OfferDetailState();
}

class _OfferDetailState extends State<OfferDetail> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Project Name',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Company Name: ABC Company',
            style: TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Project Details: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus condimentum fermentum diam, quis hendrerit nisl tincidunt non.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle accept button press
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: const Text('Accept'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  // Handle reject button press
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text('Reject'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}