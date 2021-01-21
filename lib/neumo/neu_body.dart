import 'package:flutter/material.dart';
import 'package:flutter_demos/customs/AppBarWithBack.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

// ignore: must_be_immutable
class NeumoBody extends StatelessWidget {
  int _index = 0;
  var _body = [
    Text('Home'),
    Text('Orders'),
    Text('Wallets'),
    Text('Accounts'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBack(title: 'nemo Page'),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          showUnselectedLabels: true,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.black,
                ),
                label: "Orders"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ),
                label: "Wallet"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
                label: "Account")
          ]),
      body: _body[_index],
    );
  }
}
