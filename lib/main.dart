import 'package:flutter/material.dart';

import 'config/constants.dart';
import 'pages/initial_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All COVID Resources',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: kIndianSaffronColor,
      ),
      home: InitialPage(),
    );
  }
}
