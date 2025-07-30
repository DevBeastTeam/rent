import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'home_page.dart';
import 'listing_page.dart';

GlobalKey<NavigatorState> contextKey = GlobalKey();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: AppBarTheme(backgroundColor: Colors.cyan),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: contextKey,
      home: LoginPage(),
    );
  }
}
