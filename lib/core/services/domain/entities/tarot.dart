class Tarot {
  final String name;
  final String description;
  final String image;
  final String id;

  Tarot({
    required this.name,
    required this.description,
    required this.image,
    required this.id,
  });
  Tarot copyWith({
    String? name,
    String? description,
    String? image,
    String? id,
  }) {
    return Tarot(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }
  factory Tarot.fromJson(Map<String, dynamic> json) {
    return Tarot(
      name: json['name'] as String,
      description: json['title_main'] as String,
      image: json['image'] as String,
      id: json['id'] as String,
    );
  }
}
