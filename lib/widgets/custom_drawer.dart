import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(100.0),
                image: DecorationImage(
                  image: AssetImage('assets/favicon.png'),
                ),
              ),
            ),
            accountName: Text(
              'All COVID Resources',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              'Made with ♥ in India',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          Link(
            uri: Uri.parse('https://github.com/masteradit/All-COVID-Resources'),
            target: LinkTarget.blank,
            builder: (context, followLink) => ListTile(
              onTap: followLink,
              leading: Icon(Icons.code),
              title: Text('Github Repo'),
            ),
          ),
          Link(
            uri: Uri.parse('mailto:adit.luhadia@allmityapp.com'),
            target: LinkTarget.blank,
            builder: (context, followLink) => ListTile(
              onTap: followLink,
              leading: Icon(Icons.email),
              title: Text('Contact us'),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              'v1.0.0+1',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
