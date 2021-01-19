import 'package:flutter/material.dart';
import 'package:flutter_demos/customs/customs.dart';
import 'package:flutter_demos/google_progress/main_worker.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        chigitldren: [
          FlatButton(
          
              color: Colors.blue,
              onPressed: () => goto(context, MainWorker()),
              child: Text('Google Progress Indicator'))
        ],
      ),
    );
  }
}
