class Resource {
  String name;
  String description;
  String? logoPath;
  String websiteUrl;

  Resource({
    required this.name,
    required this.description,
    this.logoPath,
    required this.websiteUrl,
  });
}
