import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../models/resource_model.dart';

class ResourceCard extends StatelessWidget {
  final Resource resource;

  const ResourceCard({
    Key? key,
    required this.resource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(resource.websiteUrl),
      target: LinkTarget.blank,
      builder: (context, followLink) => Card(
        child: ListTile(
          onTap: followLink,
          leading: CircleAvatar(
            child: Image.asset('assets/logos/${resource.iconUrl}'),
          ),
          title: Text(resource.name),
          subtitle: Text(resource.description),
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
