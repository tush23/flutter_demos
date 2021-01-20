import 'package:flutter/material.dart';
import 'package:flutter_demos/bottom_sheet/bottom_sheet_by_shivam.dart';
import 'package:flutter_demos/customs/customs.dart';
import 'package:flutter_demos/google_progress/main_worker.dart';
import 'date_extension/date_extension_by_shivam'.dart';

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
        children: [
          FlatButton(
              color: Colors.blue,
              onPressed: () => goto(context, MainWorker()),
              child: Text('Google Progress Indicator')),
          Text(
              'Extension method->${DateTime.parse('1990-06-20 08:03').beautify()}'),
          FlatButton(
              color: Colors.blue,
              onPressed: () {
                showSheet(
                    ['ram', 'shyam', 'sita', 'gita'], "Bottom Sheet", context);
              },
              child: Text('Show sheet'))
        ],
      ),
    );
  }
}
