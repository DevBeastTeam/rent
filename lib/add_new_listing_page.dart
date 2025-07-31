import 'package:flutter/material.dart';
import 'package:rent/ListingDetailPage.dart';

class AddNewListingPage extends StatelessWidget {
  const AddNewListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Listing'),
        backgroundColor: Colors.cyan,
      ),
      body: const Center(
        child: Text(
          'Form to add new listing will go here.',
          style: TextStyle(fontSize: 16),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to detail page (you can change this to your custom screen)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ListingDetailPage(
                listing: {},
                // title: 'Demo Title',
                // imageUrl: 'assets/images/listing1.png',
                // description: 'This is a preview of your listing details.',
              ),
            ),
          );
        },
        label: const Text("Preview Details"),
        icon: const Icon(Icons.remove_red_eye),
        backgroundColor: Colors.black,
      ),
    );
  }
}
