import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'config/constants.dart';
import 'pages/add_resource_page.dart';
import 'pages/admin_portal_page.dart';
import 'pages/error_page.dart';
import 'pages/home_page.dart';
import 'pages/initial_page.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';

void main() {
  setPathUrlStrategy();
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
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        primaryColor: kIndianSaffronColor,
      ),
      initialRoute: InitialPage.routeName,
      routes: {
        AddResourcePage.routeName: (_) => AddResourcePage(),
        AdminPortalPage.routeName: (_) => AdminPortalPage(),
        ErrorPage.routeName: (_) => ErrorPage(),
        HomePage.routeName: (_) => HomePage(),
        InitialPage.routeName: (_) => InitialPage(),
        LoadingPage.routeName: (_) => LoadingPage(),
        LoginPage.routeName: (_) => LoginPage(),
      },
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
      ],
    );
  }
}
