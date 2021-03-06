import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  static const String routeName = '/error';

  final String? error;

  const ErrorPage({
    Key? key,
    this.error,
  }) : super(key: key);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Oops! We encountered an error!',
              textAlign: TextAlign.center,
            ),
            error != null
                ? Text(
                    'Details: $error',
                    textAlign: TextAlign.center,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
