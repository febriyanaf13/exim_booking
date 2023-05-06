import 'dart:convert';

List<ListContainer> listContainerFromJson(List lst) =>
    List<ListContainer>.from(lst.map((x) => ListContainer.fromJson(x)));

String listContainerToJson(List<ListContainer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListContainer {
  ListContainer({
    this.id,
    this.tipeContainer,
  });

  int? id;
  String? tipeContainer;

  factory ListContainer.fromJson(Map<String, dynamic> json) => ListContainer(
        id: json["id"],
        tipeContainer: json["tipe_container"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipe_container": tipeContainer,
      };
}
