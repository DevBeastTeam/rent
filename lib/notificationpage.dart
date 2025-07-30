import 'package:flutter/material.dart';

import 'constants/data.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(AppAssets.logo, width: 100),

        actions: [
          // Icon(Icons.person_4),
          Container(
            decoration: BoxDecoration(
              color: Colors.cyan.shade700,
              borderRadius: BorderRadius.circular(4),
            ),
            width: 35,
            height: 35,
            clipBehavior: Clip.antiAlias,
            child: Image.network(ImagesLinks.profileImage),
          ),

          SizedBox(width: 20),
        ],
      ),
      body: Text(" Notification Users"),
    );
  }
}
