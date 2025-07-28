import 'package:flutter/material.dart';

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
        title: Image.asset("assets/logorent.png"),
        actions: [Icon(Icons.person_4)],
      ),
      body: Text(" Notification Users"),
    );
  }
}
