import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config/constants.dart';
import 'pages/home_page.dart';

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
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomePage(),
    );
  }
}
