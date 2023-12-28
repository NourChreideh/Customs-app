class ContactModel {
  int id;
  String name;
  String company;
  String email;
  String phone;
  String address;
  String description;
  String website;
  String createdAt;
  String updatedAt;

  ContactModel({
    required this.id,
    required this.name,
    required this.company,
    required this.email,
    required this.phone,
    required this.address,
    required this.description,
    required this.website,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      name: json['name'],
      company: json['company'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      description: json['description'],
      website: json['website'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }


}
