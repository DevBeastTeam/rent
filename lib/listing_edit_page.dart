import 'package:flutter/material.dart';
import 'add_new_listing_page.dart';
import 'listing_edit_page.dart';

class ListingEditPage extends StatelessWidget {
  const ListingEditPage({super.key});

  final List<Map<String, String>> listings = const [
    {
      "image":
          "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?auto=format&fit=crop&w=800&q=80",
      "title": "Bed Apartment",
      "price": "\$ 0/Day",
      "rating": "★★★★☆",
    },
    {
      "image":
          "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80",
      "title": "Luxury Villa",
      "price": "\$ 10/Day",
      "rating": "★★★☆☆",
    },
    {
      "image":
          "https://images.unsplash.com/photo-1600585154172-3b5f3c6ae3ea?auto=format&fit=crop&w=800&q=80",
      "title": "Family House",
      "price": "\$ 5/Day",
      "rating": "★★★★★",
    },
    {
      "image":
          "https://images.unsplash.com/photo-1572120360610-d971b9b78836?auto=format&fit=crop&w=800&q=80",
      "title": "Studio Flat",
      "price": "\$ 0/Day",
      "rating": "★★☆☆☆",
    },
    {
      "image":
          "https://images.unsplash.com/photo-1615874959474-d609969a6a84?auto=format&fit=crop&w=800&q=80",
      "title": "Modern Condo",
      "price": "\$ 12/Day",
      "rating": "★★★☆☆",
    },
    {
      "image":
          "https://images.unsplash.com/photo-1600585153943-24d048c1a9a0?auto=format&fit=crop&w=800&q=80",
      "title": "Beachfront Home",
      "price": "\$ 0/Day",
      "rating": "★★★☆☆",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: const Icon(Icons.arrow_back, size: 20, color: Colors.black),
        title: const Text(
          "My Listing",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'Search Listings...',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.77,
                children: listings.map((listing) {
                  return ListingBox(
                    image: listing["image"]!,
                    title: listing["title"]!,
                    price: listing["price"]!,
                    rating: listing["rating"]!,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[700],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNewListingPage()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class ListingBox extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String rating;

  const ListingBox({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     // MaterialPageRoute(
      //     //   builder: (context) => ListingDetailPage(
      //     //     title: title,
      //     //     imageUrl: image,
      //     //     description: "$price - $rating",
      //     //   ),
      //     // ),
      //   );
      // },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.network(
                    image,
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 6,
                  left: 6,
                  child: Row(
                    children: [
                      _iconCircle(Icons.edit, Colors.cyan, () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ListingEditPage(
                        //       title: title,
                        //       price: price,
                        //       rating: rating,
                        //       imageUrl: image,
                        //     ),
                        //   ),
                        // );
                      }),
                      const SizedBox(width: 5),
                      _iconCircle(Icons.delete, Colors.red, () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Delete tapped")),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    price,
                    style: const TextStyle(color: Colors.orange, fontSize: 12),
                  ),
                  Text(rating, style: const TextStyle(fontSize: 11)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconCircle(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
        ),
        child: Icon(icon, size: 14, color: color),
      ),
    );
  }
}
