class ProductModel {
  int? id;
  String ?name;
  String ?hsCode;
  String ?description;
  String ?image;
  String? note;
  int ?categoryId;
  String? createdAt;
  String ?updatedAt;
  Category ?category;
  List<Tax>? taxes;

  ProductModel({
     this.id,
     this.name,
     this.hsCode,
     this.description,
     this.image,
     this.note,
     this.categoryId,
     this.createdAt,
     this.updatedAt,
     this.category,
     this.taxes,
  });
factory ProductModel.fromJson(Map<String, dynamic> json) {
  return ProductModel(
    id: json['id'],
    name: json['name'],
    hsCode: json['HScode'],
    description: json['description'],
    image: json['image'],
    note: json['note'],
    categoryId: json['category_id'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    category: json['category'] != null ? Category.fromJson(json['category']) : null,
   taxes: json['taxes'] != null ? (json['taxes'] as List).map((tax) => Tax.fromJson(tax)).toList() : null,
  );
}

}

class Category {
  int ?id;
  String ?name;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  Category({
     this.id,
     this.name,
     this.description,
     this.image,
     this.createdAt,
     this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      createdAt:json['created_at'],
      updatedAt:json['updated_at'],
    );
  }
}

class Tax {
  int ?id;
  String ?name;
  String? rate;
  String ?image;
  String ?createdAt;
  String ?updatedAt;

  Tax({
     this.id,
     this.name,
     this.rate,
     this.image,
     this.createdAt,
     this.updatedAt,
  });

  factory Tax.fromJson(Map<String, dynamic> json) {
    return Tax(
      id: json['id'],
      name: json['name'],
      rate: json['rate'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
