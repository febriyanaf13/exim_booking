import 'dart:convert';

List<Packaging> packagingFromJson(List lst) =>
    List<Packaging>.from(lst.map((x) => Packaging.fromJson(x)));

String packagingToJson(List<Packaging> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Packaging {
  Packaging({
    this.packId,
    this.nama,
  });

  int? packId;
  String? nama;

  factory Packaging.fromJson(Map<String, dynamic> json) => Packaging(
        packId: json["pack_id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "pack_id": packId,
        "nama": nama,
      };
}
