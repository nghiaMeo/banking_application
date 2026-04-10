class UserModel {
  final String id;
  final String email;
  final String fullName;
  final String phone;

  const UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json['id'] ?? '').toString(),
      email: (json['email'] ?? '').toString(),
      fullName: (json['fullName'] ?? '').toString(),
      phone: (json['phone'] ?? '').toString(),
    );
  }
}
