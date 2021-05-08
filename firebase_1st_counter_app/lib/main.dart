import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter firebase demo',
      theme: ThemeData(

        primarySwatch: Colors.blue[800],

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot){
            if(snapshot.hasError){
              print('Error have ${snapshot.error.toString()}');
              return Text('Something going wrong');
            }
            else if(snapshot.hasData){
              return MyHomePage(title: 'My Flutter firebase updated');
            }
            else {
              return Center(
                child: Text('Ok'),
              );
            }
      })
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    DatabaseReference _testRef = FirebaseDatabase.instance.reference().child('Test');
    _testRef.set('Hello World : ${Random().nextInt(100)}');
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
