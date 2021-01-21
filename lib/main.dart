import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
// class MyAppwithNemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return NeumorphicApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       themeMode: ThemeMode.light,
//       theme: NeumorphicThemeData(
//         baseColor: Color(0xFFFFFFFF),
//         lightSource: LightSource.topLeft,
//         depth: 10,
//       ),
//       darkTheme: NeumorphicThemeData(
//         baseColor: Color(0xFF3E3E3E),
//         lightSource: LightSource.topLeft,
//         depth: 6,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
