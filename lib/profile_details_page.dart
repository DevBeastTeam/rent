import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent/login.dart';

import 'constants/data.dart';
import 'home_page.dart';
import 'profile_update_page.dart';

// Profile update page with full UI and fields
class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({super.key});

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("My Profile", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              SizedBox(height: 15),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(100),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(ImagesLinks.profileImage),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.black45,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.camera_alt_sharp,
                          color: Colors.white,
                          size: 16,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ProfileUpdatePage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text(
                  "Reeb A",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              CupertinoListTile(
                title: const Text(
                  "Email",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
                subtitle: const Text(
                  "reeb@example.com",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Divider(),
              CupertinoListTile(
                title: const Text(
                  "Phone Number",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
                subtitle: const Text(
                  "+92 300 0000000",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Divider(),
              CupertinoListTile(
                title: const Text(
                  "Address",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
                subtitle: const Text(
                  "Pakistan Abc Lahore",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Divider(),
              CupertinoListTile(
                title: const Text(
                  "About Us",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
                subtitle: const Text(
                  "Abc something about us",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: const Color.fromARGB(255, 5, 5, 5),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Logout",
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.exit_to_app, color: Colors.deepOrange),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.black,
        child: Icon(Icons.edit, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ProfileUpdatePage()),
          );
        },
      ),
      bottomNavigationBar: BottomNavBarWidget(currentIndex: 4),
    );
  }
}
