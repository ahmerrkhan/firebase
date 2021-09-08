import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'landingScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: newSplash(),
    );
  }
}
class newSplash extends StatefulWidget {
  @override
  _newSplashState createState() => _newSplashState();
}

class _newSplashState extends State<newSplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: landingScreen(),
      loaderColor: Colors.black,   
      gradientBackground: LinearGradient(
        colors: [Colors.orangeAccent,Colors.red],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
