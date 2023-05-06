import 'dart:convert';

List<Carriers> carriersFromJson(List lst) =>
    List<Carriers>.from(lst.map((x) => Carriers.fromJson(x)));

String carriersToJson(List<Carriers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Carriers {
  Carriers({
    this.id,
    this.corporate,
    this.namaCustomer,
    this.industries,
    this.alamat,
    this.city,
    this.state,
    this.country,
    this.npwp,
    this.npwpName,
    this.creditTerms,
    this.creditLimit,
    this.status,
  });

  int? id;
  String? corporate;
  String? namaCustomer;
  String? industries;
  String? alamat;
  String? city;
  String? state;
  String? country;
  String? npwp;
  String? npwpName;
  String? creditTerms;
  String? creditLimit;
  String? status;

  factory Carriers.fromJson(Map<String, dynamic> json) => Carriers(
        id: json["id"],
        corporate: json["corporate"],
        namaCustomer: json["nama_customer"],
        industries: json["industries"],
        alamat: json["alamat"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        npwp: json["npwp"],
        npwpName: json["npwp_name"],
        creditTerms: json["credit_terms"],
        creditLimit: json["credit_limit"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "corporate": corporate,
        "nama_customer": namaCustomer,
        "industries": industries,
        "alamat": alamat,
        "city": city,
        "state": state,
        "country": country,
        "npwp": npwp,
        "npwp_name": npwpName,
        "credit_terms": creditTerms,
        "credit_limit": creditLimit,
        "status": status,
      };
}
