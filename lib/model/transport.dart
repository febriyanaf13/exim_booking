import 'dart:convert';

List<TransportMode> transportModeFromJson(List lst) =>
    List<TransportMode>.from(
        lst.map((x) => TransportMode.fromJson(x)));

String transportModeToJson(List<TransportMode> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransportMode {
  TransportMode({
    this.activityId,
    this.activityName,
  });

  int? activityId;
  String? activityName;

  factory TransportMode.fromJson(Map<String, dynamic> json) => TransportMode(
        activityId: json["activity_id"],
        activityName: json["activity_name"],
      );

  Map<String, dynamic> toJson() => {
        "activity_id": activityId,
        "activity_name": activityName,
      };
}
