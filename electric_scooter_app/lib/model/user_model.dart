// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String? fullname;
  final String? email;
  final String? phone;
  final String? address;
  final String? password;

  User({
    this.fullname,
    this.email,
    this.phone,
    this.address,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        fullname: json['fullname'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'email': email,
      'phone': phone,
      'address': address,
      'password': password,
    };
  }
}
