import 'package:flutter/material.dart';
import 'package:flutter_demos/bottom_sheet/bottom_sheet_by_shivam.dart';
import 'package:flutter_demos/customs/customs.dart';
import 'package:flutter_demos/google_progress/main_worker.dart';
import 'package:flutter_demos/neumo/NeumoPage.dart';
import 'package:flutter_demos/paintss/paintProgress.dart';
import 'package:flutter_demos/popUp_menu/pop_menu.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'date_extension/date_extension_by_shivam.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
                child: const Text('Google Progress Indicator')),
            FlatButton(
                color: Colors.blue,
                onPressed: () => goto(context, MyPainter()),
                child: const Text('My Painter')),
            FlatButton(
                color: Colors.blue,
                onPressed: () => goto(context, NeumoPage()),
                child: const Text('My Neumo Page')),
            Text(
                'Extension method->${DateTime.parse('1990-06-20 08:03').beautify()}'),
            FlatButton(
                color: Colors.blue,
                onPressed: () {
                  showSheet(['ram', 'shyam', 'sita', 'gita'], "Bottom Sheet",
                      context);
                },
                child: const Text('Show sheet')),
            FlatButton(
                color: Colors.blue,
                onPressed: () => showAboutDialog(
                      context: context,
                      applicationIcon: const Icon(Icons.ac_unit),
                      applicationName: 'Demo App',
                      applicationVersion: '1.0.0',
                    ),
                child: const Text('AboutDialog')),
            FlatButton(
                color: Colors.blue,
                onPressed: () => goto(context, Mainapp()),
                child: const Text('_showPopupMenu')),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                // style: NeumorphicStyle(
                //     color: Colors.white,
                //     boxShape: NeumorphicBoxShape.roundRect(
                //         BorderRadius.circular(30))),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    // icon: Icon(Icons.search),
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
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
      position: const RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        const PopupMenuItem<String>(child: Text('Doge'), value: 'Doge'),
        const PopupMenuItem<String>(child: Text('Lion'), value: 'Lion'),
      ],
      elevation: 8.0,
    );
  }
}
