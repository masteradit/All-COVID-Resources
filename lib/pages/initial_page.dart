import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'error_page.dart';
import 'home_page.dart';
import 'loading_page.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorPage(
            error: snapshot.error.toString(),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        }

        return HomePage();
      },
    );
  }
}
