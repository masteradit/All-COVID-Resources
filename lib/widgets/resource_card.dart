import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ResourceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse('https://allmityapp.com/'),
      target: LinkTarget.blank,
      builder: (context, followLink) => Card(
        child: ListTile(
          onTap: followLink,
          leading: CircleAvatar(
            child: Image.asset('assets/logos/Allmity.png'),
          ),
          title: Text('Resource name'),
          subtitle: Text('Test description of this resource'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // IconButton(icon: Icon(Icons.info), onPressed: () {}),
              IconButton(icon: Icon(Icons.open_in_new), onPressed: followLink),
            ],
          ),
        ),
      ),
    );
  }
}
