class AuthResponseModel {
  final String token;
  final int userId;

  AuthResponseModel({
    required this.token,
    required this.userId,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      token: json['token'],
      userId: json['userId'],
    );
  }
}
