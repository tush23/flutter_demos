import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

// ignore: must_be_immutable
class NeumoBody extends StatelessWidget {
  final int _index = 3;
  final _body = [
    const Text('Home'),
    const Text('Orders'),

    const Text('Wallets'),

    const Text('Accounts'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBarWithBack(title: 'nemo Page'),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          showUnselectedLabels: true,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.black,
                ),
                label: "Orders"),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ),
                label: "Wallet"),
            const BottomNavigationBarItem(
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
