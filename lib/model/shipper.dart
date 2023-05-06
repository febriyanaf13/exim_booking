import 'dart:convert';

List<Shipper> shipperFromJson(List lst) =>
    List<Shipper>.from(lst.map((x) => Shipper.fromJson(x)));

String shipperToJson(List<Shipper> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Shipper {
  Shipper({
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

  factory Shipper.fromJson(Map<String, dynamic> json) => Shipper(
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
