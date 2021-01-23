import 'package:flutter/material.dart';

import 'google_colored_circuler_progress.dart';

class MainWorker extends StatefulWidget {
  @override
  _MainWorkerState createState() => _MainWorkerState();
}
double prValue=0.0;


class _MainWorkerState extends State<MainWorker> {
  double getPr(){
    if(prValue<100.0){
      setState(() {
        print('PRVALUE-$prValue');
        prValue=prValue*10;
      });
    }else prValue=0.0;
    return prValue;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainWorker'),
      ),
      body: const Center(
        child:  SizedBox(
          width: 100,
          height: 100,
          child:  CustomCircularProgressIndicator(strokeWidth: 10,colored: false,),
        ),
      ),
    );
  }
}
