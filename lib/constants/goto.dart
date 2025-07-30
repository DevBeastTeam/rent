import 'package:flutter/material.dart';
import 'package:rent/main.dart';

goto(pageName) {
  Navigator.push(
    contextKey.currentState!.context,
    MaterialPageRoute(builder: (BuildContext context) => pageName),
  );
}
