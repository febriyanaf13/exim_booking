import 'dart:convert';

List<ListKota> listKotaFromJson(List list) =>
    List<ListKota>.from(list.map((x) => ListKota.fromJson(x)));

String listKotaToJson(List<ListKota> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListKota {
  ListKota({
    this.id,
    this.kodeKota,
    this.namaKota,
    this.kodeNegara,
    this.namaNegara,
    this.unCode,
    this.region,
  });

  int? id;
  String? kodeKota;
  String? namaKota;
  String? kodeNegara;
  String? namaNegara;
  String? unCode;
  String? region;

  factory ListKota.fromJson(Map<String, dynamic> json) => ListKota(
        id: json["id"],
        kodeKota: json["kode_kota"],
        namaKota: json["nama_kota"],
        kodeNegara: json["kode_negara"],
        namaNegara: json["nama_negara"],
        unCode: json["un_code"],
        region: json["region"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode_kota": kodeKota,
        "nama_kota": namaKota,
        "kode_negara": kodeNegara,
        "nama_negara": namaNegara,
        "un_code": unCode,
        "region": region,
      };
}
