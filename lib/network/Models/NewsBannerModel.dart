class NewsBannerModel {
  final int? id;
  final String ?name;
  final String? description;
  final String ?image;
  final String ?createdAt;
  final String? updatedAt;

  NewsBannerModel({
     this.id,
     this.name,
     this.description,
     this.image,
     this.createdAt,
     this.updatedAt,
  });

  factory NewsBannerModel.fromJson(Map<String, dynamic> json) {
    return NewsBannerModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
