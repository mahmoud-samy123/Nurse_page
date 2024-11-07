import 'package:flutter/material.dart';
import 'package:lovenurse/screens/home_screen.dart';

void main() {
  runApp(NursingApp());
}

class NursingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NursingHomePage(),
    );
  }
}
