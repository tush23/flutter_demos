import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

Widget appBarWithBack({@required String title}) {
  return AppBar(
    centerTitle: true,
    title: Text(title),
    leading: Container(
      padding: EdgeInsets.all(7),
      child: NeumorphicBackButton(
        onPressed: () => Get.back(),
        // forward: false,
        padding: EdgeInsets.all(5),

        style: NeumorphicStyle(
            color: Colors.blue,
            shadowDarkColor: Colors.white.withOpacity(0.5),
            // shadowDarkColorEmboss: Colors.white,
            // shadowDarkColor: Colors.blue[700],
            shadowLightColor: Colors.white.withOpacity(0.8),
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.circle()),
      ),
    ),
  );
}
