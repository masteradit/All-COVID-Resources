import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'add_resource_page.dart';
import 'error_page.dart';
import 'loading_page.dart';
import 'login_page.dart';

class AdminPortalPage extends StatelessWidget {
  static const String routeName = '/admin-portal';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorPage();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        }

        if (!snapshot.hasData) {
          return LoginPage();
        }

        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Text(
              'Admin Portal',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: ListView(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(AddResourcePage.routeName);
                },
                leading: Icon(Icons.add_circle),
                title: Text('Add a resource'),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        );
      },
    );
  }
}
