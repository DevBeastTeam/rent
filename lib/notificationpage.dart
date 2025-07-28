import 'package:flutter/material.dart';

class notificationpage extends StatefulWidget {
  const notificationpage({super.key});

  @override
  State<notificationpage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<notificationpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset("assets/logorent.png"),
        actions: [Icon(Icons.person_4)],
      ),
    );
  }
}
