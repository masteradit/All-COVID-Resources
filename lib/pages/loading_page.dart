import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  static const String routeName = '/loading';

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics().setCurrentScreen(screenName: routeName);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'All COVID Resources',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
