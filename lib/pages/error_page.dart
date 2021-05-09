import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';

class ErrorPage extends StatelessWidget {
  final String? error;

  const ErrorPage({
    Key? key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          children: [
            Text(
              'Oops! We encountered an error!',
              textAlign: TextAlign.center,
            ),
            error != null ? Text('Details: $error') : Container(),
          ],
        ),
      ),
    );
  }
}
