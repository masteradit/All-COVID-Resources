class Resource {
  String name;
  String description;
  String? logoUrl;
  String websiteUrl;

  Resource({
    required this.name,
    required this.description,
    this.logoUrl,
    required this.websiteUrl,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        name: json["name"],
        description: json["description"],
        logoUrl: json["logoPath"],
        websiteUrl: json["websiteUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "logoPath": logoUrl,
        "websiteUrl": websiteUrl,
      };
}
