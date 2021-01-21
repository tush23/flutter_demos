import 'package:flutter/material.dart';

class PopUpMenu extends StatefulWidget {
  @override
  _PopUpMenuState createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  final GlobalKey _menuKey = new GlobalKey();
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    final button = new PopupMenuButton(
        icon: Icon(Icons.ac_unit),
        key: _menuKey,
        itemBuilder: (_) => <PopupMenuItem<String>>[
              new PopupMenuItem<String>(
                  child: const Text('Doge'), value: 'Doge'),
              new PopupMenuItem<String>(
                  child: const Text('Lion'), value: 'Lion'),
            ],
        onSelected: (_) {});

    final tile = new ListTile(
        title: new Text('Doge or lion?'),
        trailing: button,
        onTap: () {
          // This is a hack because _PopupMenuButtonState is private.
          dynamic state = _menuKey.currentState;
          state.showButtonMenu();
        });
    return new Scaffold(
        body: new Center(
          child: tile,
        ),
        floatingActionButton: FloatingActionButton(
          child: isClicked
              ? Container(
                  color: Colors.red,
                  child: Column(
                    children: [
                      Text('Data'),
                      Text('Data'),
                      Text('Data'),
                      Text('Data')
                    ],
                  ),
                )
              : null,
          onPressed: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
        ));
  }
}
