import 'dart:convert';

List<ListCommodity> commodityFromJson(List lst) =>
    List<ListCommodity>.from(lst.map((x) => ListCommodity.fromJson(x)));

String commodityToJson(List<ListCommodity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListCommodity {
  ListCommodity({
    this.id,
    this.namaCommodity,
  });

  int? id;
  String? namaCommodity;

  factory ListCommodity.fromJson(Map<String, dynamic> json) => ListCommodity(
        id: json["id"],
        namaCommodity: json["nama_commodity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_commodity": namaCommodity,
      };
}
