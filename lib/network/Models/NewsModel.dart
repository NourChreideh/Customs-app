class NewsModel {
  final int? id;
  final String ?name;
  final String? description;
  final String? image;
  final String? updatedAt;
  final String? createdAt;

  NewsModel({
     this.id,
     this.name,
     this.description,
     this.image,
     this.updatedAt,
     this.createdAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
    );
  }
}
