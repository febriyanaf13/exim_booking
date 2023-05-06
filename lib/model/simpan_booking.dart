import 'dart:convert';

SimpanBooking simpanBookingFromJson(String str) =>
    SimpanBooking.fromJson(json.decode(str));

String simpanBookingToJson(SimpanBooking data) => json.encode(data.toJson());

class SimpanBooking {
  SimpanBooking({
    this.userId,
    this.transportMode,
    this.quotationNumber,
    this.portLoading,
    this.portDischarge,
    this.smOrigin,
    this.smDeparture,
    this.dateDeparture,
    this.dateArrival,
    this.metric,
    this.fcllcl,
    this.scheduleId,
    this.shipper,
    this.consignee,
    this.notifyParty,
    this.carrier,
    this.bookingParty,
    this.paymentType,
    this.paymentLocation,
    this.notes,
    this.specialHandling,
    this.cargoPickup,
    this.cargoDelivery,
    this.cargoInsurance,
    this.portFee,
    this.customClearance,
    this.lcl,
    this.fcl,
    this.commodities,
  });

  int? userId;
  String? transportMode;
  String? quotationNumber;
  String? portLoading;
  String? portDischarge;
  String? smOrigin;
  String? smDeparture;
  DateTime? dateDeparture;
  DateTime? dateArrival;
  String? metric;
  String? fcllcl;
  String? scheduleId;
  String? shipper;
  String? consignee;
  String? notifyParty;
  String? carrier;
  String? bookingParty;
  String? paymentType;
  String? paymentLocation;
  String? notes;
  String? specialHandling;
  String? cargoPickup;
  String? cargoDelivery;
  String? cargoInsurance;
  String? portFee;
  String? customClearance;
  List<Lcl>? lcl;
  List<Fcl>? fcl;
  List<Commodity>? commodities;

  factory SimpanBooking.fromJson(Map<String, dynamic> json) => SimpanBooking(
        userId: json["user_id"],
        transportMode: json["transport_mode"],
        quotationNumber: json["quotation_number"],
        portLoading: json["port_loading"],
        portDischarge: json["port_discharge"],
        smOrigin: json["sm_origin"],
        smDeparture: json["sm_departure"],
        dateDeparture: DateTime.parse(json["date_departure"]),
        dateArrival: DateTime.parse(json["date_arrival"]),
        metric: json["metric"],
        fcllcl: json["fcllcl"],
        scheduleId: json["schedule_id"],
        shipper: json["shipper"],
        consignee: json["consignee"],
        notifyParty: json["notify_party"],
        carrier: json["carrier"],
        bookingParty: json["booking_party"],
        paymentType: json["payment_type"],
        paymentLocation: json["payment_location"],
        notes: json["notes"],
        specialHandling: json["special_handling"],
        cargoPickup: json["cargo_pickup"],
        cargoDelivery: json["cargo_delivery"],
        cargoInsurance: json["cargo_insurance"],
        portFee: json["port_fee"],
        customClearance: json["custom_clearance"],
        lcl: List<Lcl>.from(json["lcl"].map((x) => Lcl.fromJson(x))),
        fcl: List<Fcl>.from(json["fcl"].map((x) => Fcl.fromJson(x))),
        commodities: List<Commodity>.from(
            json["commodities"].map((x) => Commodity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "transport_mode": transportMode,
        "quotation_number": quotationNumber,
        "port_loading": portLoading,
        "port_discharge": portDischarge,
        "sm_origin": smOrigin,
        "sm_departure": smDeparture,
        "date_departure":
            "${dateDeparture!.year.toString().padLeft(4, '0')}-${dateDeparture!.month.toString().padLeft(2, '0')}-${dateDeparture!.day.toString().padLeft(2, '0')}",
        "date_arrival":
            "${dateArrival!.year.toString().padLeft(4, '0')}-${dateArrival!.month.toString().padLeft(2, '0')}-${dateArrival!.day.toString().padLeft(2, '0')}",
        "metric": metric,
        "fcllcl": fcllcl,
        "schedule_id": scheduleId,
        "shipper": shipper,
        "consignee": consignee,
        "notify_party": notifyParty,
        "carrier": carrier,
        "booking_party": bookingParty,
        "payment_type": paymentType,
        "payment_location": paymentLocation,
        "notes": notes,
        "special_handling": specialHandling,
        "cargo_pickup": cargoPickup,
        "cargo_delivery": cargoDelivery,
        "cargo_insurance": cargoInsurance,
        "port_fee": portFee,
        "custom_clearance": customClearance,
        "lcl": List<dynamic>.from(lcl!.map((x) => x.toJson())),
        "fcl": List<dynamic>.from(fcl!.map((x) => x.toJson())),
        "commodities": List<dynamic>.from(commodities!.map((x) => x.toJson())),
      };
}

class Commodity {
  Commodity({
    this.commodity,
    this.hsCode,
    this.dangerous,
    this.imoClass,
    this.unNumber,
  });

  String? commodity;
  String? hsCode;
  bool? dangerous;
  String? imoClass;
  String? unNumber;

  factory Commodity.fromJson(Map<String, dynamic> json) => Commodity(
        commodity: json["commodity"],
        hsCode: json["hs_code"],
        dangerous: json["dangerous"],
        imoClass: json["imo_class"],
        unNumber: json["un_number"],
      );

  Map<String, dynamic> toJson() => {
        "commodity": commodity,
        "hs_code": hsCode,
        "dangerous": dangerous,
        "imo_class": imoClass,
        "un_number": unNumber,
      };
}

class Fcl {
  Fcl({
    this.qty,
    this.grossWeight,
    this.netWeight,
    this.meas,
    this.size,
  });

  String? qty;
  String? grossWeight;
  String? netWeight;
  String? meas;
  String? size;

  factory Fcl.fromJson(Map<String, dynamic> json) => Fcl(
        qty: json["qty"],
        grossWeight: json["gross_weight"],
        netWeight: json["net_weight"],
        meas: json["meas"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "qty": qty,
        "gross_weight": grossWeight,
        "net_weight": netWeight,
        "meas": meas,
        "size": size,
      };
}

class Lcl {
  Lcl({
    this.packaging,
    this.length,
    this.width,
    this.height,
    this.grossWeight,
    this.qty,
  });

  String? packaging;
  String? length;
  String? width;
  String? height;
  String? grossWeight;
  String? qty;

  factory Lcl.fromJson(Map<String, dynamic> json) => Lcl(
        packaging: json["packaging"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        grossWeight: json["gross_weight"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "packaging": packaging,
        "length": length,
        "width": width,
        "height": height,
        "gross_weight": grossWeight,
        "qty": qty,
      };
}
