import 'dart:convert';

List<User> userFromJson(List list) =>
    List<User>.from(list.map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.userid,
    this.username,
    this.nama,
    this.email,
    this.telepon,
    this.initial,
    this.cabangid,
    this.namaCabang,
    this.namaPerusahaan,
  });

  int? userid;
  String? username;
  String? nama;
  String? email;
  String? telepon;
  String? initial;
  int? cabangid;
  String? namaCabang;
  String? namaPerusahaan;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userid: json["userid"],
        username: json["username"],
        nama: json["nama"],
        email: json["email"],
        telepon: json["telepon"],
        initial: json["initial"],
        cabangid: json["cabangid"],
        namaCabang: json["nama_cabang"],
        namaPerusahaan: json["nama_perusahaan"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "username": username,
        "nama": nama,
        "email": email,
        "telepon": telepon,
        "initial": initial,
        "cabangid": cabangid,
        "nama_cabang": namaCabang,
        "nama_perusahaan": namaPerusahaan,
      };
}
