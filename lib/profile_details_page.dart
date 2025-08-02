import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Update Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

// Home page with profile icon in AppBar
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileUpdatePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(child: Text("Welcome to Home Page")),
    );
  }
}

// Profile update page with full UI and fields
class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  final nameController = TextEditingController(text: "John David");
  final phoneController = TextEditingController(text: "03012345678");
  final emailController = TextEditingController(
    text: "hasanameer386@gmail.com",
  );
  final aboutController = TextEditingController(
    text: "Avid traveler\nEnjoy mountains and outdoors",
  );
  final addressController = TextEditingController(
    text: "2452 Rooney Rd\nChattanooga , TN 21497",
  );

  bool sendEmails = true;
  bool acceptPrivacy = false;
  bool acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d",
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.black,
                      child: Icon(Icons.edit, color: Colors.cyan, size: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                "Pick Images",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 22),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 16,
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: "Phone",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 16,
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 16,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: aboutController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "About Us",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 16,
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: addressController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: "Address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Text(
                  "Verified By ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  "google",
                  style: TextStyle(
                    fontFamily: 'monospace',
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Send Emails",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Switch(
                  value: sendEmails,
                  onChanged: (value) {
                    setState(() {
                      sendEmails = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: acceptPrivacy,
                  onChanged: (val) {
                    setState(() {
                      acceptPrivacy = val ?? false;
                    });
                  },
                  visualDensity: VisualDensity.compact,
                ),
                Expanded(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text("I accept the "),
                      GestureDetector(
                        onTap: () {
                          // Open privacy policy link or dialog
                        },
                        child: const Text(
                          "Privacy Policy",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const Text(" "),
                      Checkbox(
                        value: acceptTerms,
                        onChanged: (val) {
                          setState(() {
                            acceptTerms = val ?? false;
                          });
                        },
                        visualDensity: VisualDensity.compact,
                      ),
                      const Text("Terms and Conditions"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: (acceptPrivacy && acceptTerms)
                    ? () {
                        // You can add your save/update logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Profile Updated Successfully!'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    : null,
                child: const Text(
                  "Update Profile",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
