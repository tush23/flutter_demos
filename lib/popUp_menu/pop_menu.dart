import 'package:fab_menu_items/fab_menu_items.dart';
import 'package:flutter/material.dart';

class PopUpMenu extends StatefulWidget {
  @override
  _PopUpMenuState createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    // final button = new PopupMenuButton(
    //     icon: Icon(Icons.ac_unit),
    //     key: _menuKey,
    //     itemBuilder: (_) => <PopupMenuItem<String>>[
    //           new PopupMenuItem<String>(
    //               child: const Text('Doge'), value: 'Doge'),
    //           new PopupMenuItem<String>(
    //               child: const Text('Lion'), value: 'Lion'),
    //         ],
    //     onSelected: (_) {});

    // final tile = new ListTile(
    //     title: new Text('Doge or lion?'),
    //     trailing: button,
    //     onTap: () {
    //       // This is a hack because _PopupMenuButtonState is private.
    //       dynamic state = _menuKey.currentState;
    //       state.showButtonMenu();
    //     });
    return Scaffold(
        body: const Center(
          child: Text('ss'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: isClicked
              ? Container(
                  color: Colors.red,
                  child: Column(
                    children: [
                      const Text('Data'),
                      const Text('Data'),
                      const Text('Data'),
                      const Text('Data')
                    ],
                  ),
                )
              : null,
        ));
  }
}

class Mainapp extends StatefulWidget {
  @override
  _MainappState createState() => _MainappState();
}

class _MainappState extends State<Mainapp> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: Container(
            child: Center(
              child: Text('Fab Menu Items'),
            ),
          ),
        ),
        Fabmenuitems(
          // height: 310,
          // weith: 150,
          animatedIcons: AnimatedIcons.menu_close,
          fabcolor: Colors.black,
          containercolor: Colors.white,
          childrens: List.generate(
              4,
              (index) => Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 2),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.bubble_chart,
                              size: 24,
                              color: Colors.indigo,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              "Dummy two",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ))
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  )),
        )
      ],
    );
  }
}
