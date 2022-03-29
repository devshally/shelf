class Author {
  final String link;
  final String bio;
  final String description;
  final String id;
  final String name;
  final int quoteCount;
  final String slug;
  final String dateAdded;
  final String dateModified;

  Author({
    required this.link,
    required this.bio,
    required this.description,
    required this.id,
    required this.name,
    required this.quoteCount,
    required this.slug,
    required this.dateAdded,
    required this.dateModified,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      link: json['link'],
      bio: json['bio'],
      description: json['description'],
      id: json['_id'],
      name: json['name'],
      quoteCount: json['quoteCount'] as int,
      slug: json['slug'],
      dateAdded: json['dateAdded'],
      dateModified: json['dateModified'],
    );
  }
}
