import 'package:flutter/material.dart';

void goto(BuildContext context, Widget page)  {
  Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}
