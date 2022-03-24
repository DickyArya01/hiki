class User {
  int id;
  String nama;
  String nomer;
  String password;
  String email;
  String loginAt;

  User(
      {required this.id,
      required this.nama,
      required this.nomer,
      required this.password,
      required this.email,
      required this.loginAt});

  factory User.fromJson(Map json) {
    return User(
        id: json['id'],
        nama: json['nama'],
        nomer: json['nomer'],
        password: json['password'],
        email: json['email'],
        loginAt: DateTime.now().toString());
  }
}
