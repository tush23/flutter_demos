import 'package:flutter/material.dart';
import 'package:flutter_demos/bottom_sheet/bottom_sheet_by_shivam.dart';
import 'package:flutter_demos/customs/customs.dart';
import 'package:flutter_demos/google_progress/main_worker.dart';
import 'package:flutter_demos/neumo/NeumoPage.dart';
import 'package:flutter_demos/paintss/paintProgress.dart';
import 'package:flutter_demos/popUp_menu/pop_menu.dart';
import 'date_extension/date_extension_by_shivam.dart';

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
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
            FlatButton(
                color: Colors.blue,
                onPressed: () => goto(context, MainWorker()),
                child: Text('Google Progress Indicator')),
            FlatButton(
                color: Colors.blue,
                onPressed: () => goto(context, MyPainter()),
                child: Text('My Painter')),
            FlatButton(
                color: Colors.blue,
                onPressed: () => goto(context, NeumoPage()),
                child: Text('My Neumo Page')),
            Text(
                'Extension method->${DateTime.parse('1990-06-20 08:03').beautify()}'),
            FlatButton(
                color: Colors.blue,
                onPressed: () {
                  showSheet(['ram', 'shyam', 'sita', 'gita'], "Bottom Sheet",
                      context);
                },
                child: Text('Show sheet')),
            FlatButton(
                color: Colors.blue,
                onPressed: () => showAboutDialog(
                      context: context,
                      applicationIcon: Icon(Icons.ac_unit),
                      applicationName: 'Demo App',
                      applicationVersion: '1.0.0',
                    ),
                child: Text('AboutDialog')),
            FlatButton(
                color: Colors.blue,
                onPressed: () => goto(context, PopUpMenu()),
                child: Text('_showPopupMenu')),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    // icon: Icon(Icons.search),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _showPopupMenu() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        PopupMenuItem<String>(child: const Text('Doge'), value: 'Doge'),
        PopupMenuItem<String>(child: const Text('Lion'), value: 'Lion'),
      ],
      elevation: 8.0,
    );
  }
}
