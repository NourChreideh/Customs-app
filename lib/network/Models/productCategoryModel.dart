class ProductCtegoryModel {
  final int ?id;
  final String? name;
  final String? hsCode;
  final String? description;
  final String? image;
  final String? note;
  final int? categoryId;
  final String? createdAt;
  final String? updatedAt;

  ProductCtegoryModel({
     this.id,
     this.name,
     this.hsCode,
     this.description,
     this.image,
     this.note,
     this.categoryId,
     this.createdAt,
     this.updatedAt,
  });

  factory ProductCtegoryModel.fromJson(Map<String?, dynamic> json) {
    return ProductCtegoryModel(
      id: json['id'],
      name: json['name'],
      hsCode: json['HScode'],
      description: json['description'],
      image: json['image'],
      note: json['note'],
      categoryId: json['category_id'],
      createdAt:json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
