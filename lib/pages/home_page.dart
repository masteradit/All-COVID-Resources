import 'package:flutter/material.dart';

import '../config/resources_list.dart';
import '../widgets/resource_card.dart';

class HomePage extends StatelessWidget {
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
      drawer: Drawer(
        child: ListView(),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        itemCount: resourceList.length,
        itemBuilder: (context, index) => ResourceCard(
          resource: resourceList[index],
        ),
      ),
    );
  }
}
