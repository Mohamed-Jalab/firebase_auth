class UserModel {
  final String? username;
  final String email;
  final String password;

  const UserModel({
    this.username,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        password: json['password'],
        username: json['username']);
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password, 'username': username};
  }
  
}
