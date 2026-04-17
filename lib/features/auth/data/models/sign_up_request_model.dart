class SignUpRequestModel {
  final String fullName;
  final String email;
  final String phone;
  final String password;

  const SignUpRequestModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'password': password,
      };
}
