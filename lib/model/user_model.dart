class UserModel {
  final String? name;
  final String? id;
  final String? email;

  UserModel({
    this.name,
    this.id,
    this.email,
  });
  factory UserModel.fromJson(Map<String, dynamic> doc) {
    return UserModel(
      id: doc['id'],
      name: doc["name"] ?? "",
      email: doc["email"] ?? "",
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };
  UserModel copyWith({
    String? name,
    String? id,
    String? email,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }
}
