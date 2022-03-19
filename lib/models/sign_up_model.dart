class SignUpModel {
  String name;
  String email;
  String password;
  String phone;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['f_name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    return data;
  }
}
