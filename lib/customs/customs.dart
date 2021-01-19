import 'package:flutter/material.dart';

goto(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}
