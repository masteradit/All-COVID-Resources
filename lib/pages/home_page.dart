import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/resource_model.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/resource_card.dart';
import 'error_page.dart';
import 'loading_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('resources').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorPage(
            error: snapshot.error.toString(),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        }

        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return ErrorPage(
            error:
                'No resources found! Please check your internet connection or contact us!',
          );
        }

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
          drawer: CustomDrawer(),
          body: ListView.builder(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => ResourceCard(
              resource: Resource.fromJson(snapshot.data!.docs[index].data()),
            ),
          ),
        );
      },
    );
  }
}
