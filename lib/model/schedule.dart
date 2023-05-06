import 'dart:convert';

List<Schedule> scheduleFromJson(List lst) =>
    List<Schedule>.from(lst.map((x) => Schedule.fromJson(x)));

String scheduleToJson(List<Schedule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Schedule {
  Schedule({
    this.id,
    this.tglDeparture,
    this.tglArrival,
    this.placeDeparture,
    this.placeArrival,
    this.voyageDeparture,
    this.voyageArrival,
    this.vesselDeparture,
    this.vesselArrival,
    this.transportMode,
    this.carrierId,
    this.carrier,
  });

  int? id;
  String? tglDeparture;
  String? tglArrival;
  String? placeDeparture;
  String? placeArrival;
  String? voyageDeparture;
  String? voyageArrival;
  String? vesselDeparture;
  String? vesselArrival;
  String? transportMode;
  int? carrierId;
  Carrier? carrier;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        tglDeparture: json["tgl_departure"],
        tglArrival: json["tgl_arrival"],
        placeDeparture: json["place_departure"],
        placeArrival: json["place_arrival"],
        voyageDeparture: json["voyage_departure"],
        voyageArrival: json["voyage_arrival"],
        vesselDeparture: json["vessel_departure"],
        vesselArrival: json["vessel_arrival"],
        transportMode: json["transport_mode"],
        carrierId: json["carrier_id"],
        carrier: Carrier.fromJson(json["carrier"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tgl_departure": tglDeparture,
        "tgl_arrival": tglArrival,
        "place_departure": placeDeparture,
        "place_arrival": placeArrival,
        "voyage_departure": voyageDeparture,
        "voyage_arrival": voyageArrival,
        "vessel_departure": vesselDeparture,
        "vessel_arrival": vesselArrival,
        "transport_mode": transportMode,
        "carrier_id": carrierId,
        "carrier": carrier?.toJson(),
      };
}

class Carrier {
  Carrier({
    this.id,
    this.corporate,
    this.codeCustomer,
    this.nama,
    this.industries,
  });

  int? id;

  String? corporate;
  String? codeCustomer;
  String? nama;
  String? industries;

  factory Carrier.fromJson(Map<String, dynamic> json) => Carrier(
        id: json["id"],
        corporate: json["corporate"],
        codeCustomer: json["code_customer"],
        nama: json["nama"],
        industries: json["industries"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "corporate": corporate,
        "code_customer": codeCustomer,
        "nama": nama,
        "industries": industries,
      };
}
