import 'package:flutter/material.dart';
import 'landingPage.dart';


void main() =>
  runApp(MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo TODO app',
      theme: ThemeData(),
      home: landingPage(),
    );
  }
}

