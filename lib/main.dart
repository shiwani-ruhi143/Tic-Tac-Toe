import 'package:flutter/material.dart';

import 'introscreen.dart';


void main() {
  runApp(Homepage());
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     
      home: IntroScreen(),
    );
  }
}


