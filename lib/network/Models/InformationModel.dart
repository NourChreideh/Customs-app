class InformationModel {
  final int id;
  final String name;
  final String description;
  final String createdAt;
  final String updatedAt;

  InformationModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InformationModel.fromJson(Map<String, dynamic> json) {
    return InformationModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      createdAt:json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
