import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/resource_model.dart';
import 'error_page.dart';
import 'loading_page.dart';
import 'login_page.dart';

class AddResourcePage extends StatelessWidget {
  static const String routeName = '/add-resource';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    late String _name;
    late String _description;
    String? _logoUrl;
    late String _websiteUrl;

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
              'Add Resource',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              children: [
                TextFormField(
                  onChanged: (value) {
                    _name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (value) {
                    _description = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (value) {
                    _logoUrl = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Logo Url',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (value) {
                    _websiteUrl = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a website url';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Website Url',
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (_logoUrl == '') {
                        _logoUrl = null;
                      }

                      await FirebaseFirestore.instance
                          .collection('resources')
                          .add(Resource(
                            name: _name,
                            description: _description,
                            logoUrl: _logoUrl,
                            websiteUrl: _websiteUrl,
                          ).toJson());
                    }
                  },
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
