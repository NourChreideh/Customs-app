class CategoriesModel {
  int id;
  String name;
  String description;
  String image;
  String createdAt;
  String updatedAt;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt:json['updated_at'],
    );
  }
  
  @override
  String toString() {
    return 'CategoriesModel{id: $id, name: $name, description: $description, image: $image, createdAt: $createdAt, updatedAt: $updatedAt}';
  }


}
