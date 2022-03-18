class LoginModel {
  String name;
  String password;
  String token;

  LoginModel({
    required this.name,
    required this.password,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = name;
    data['password'] = password;
    data['request_token'] = token;
    return data;
  }
}
