import 'package:flutter/material.dart';

extension goto(context, page)  {
  Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}
