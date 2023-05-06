class ListShipmentBooking {
  ListShipmentBooking({
    this.id,
    this.containerType,
    this.size,
    this.packaging,
    this.qty,
    this.grossWeight,
    this.netWeight,
    this.meas,
    this.length,
    this.width,
    this.height,
    this.statusMatric,
  });

  int? id;
  String? containerType;
  String? size;
  String? packaging;
  String? qty;
  String? grossWeight;
  String? netWeight;
  String? meas;
  String? length;
  String? width;
  String? height;
  bool? statusMatric;

  factory ListShipmentBooking.fromJson(Map<String, dynamic> json) =>
      ListShipmentBooking(
        size: json["size"],
        netWeight: json["net-weight"],
        meas: json["meas"],
        grossWeight: json["gross-weight"],
        qty: json["qty"],
        packaging: json["packaging"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "net-weight": netWeight,
        "meas": meas,
        "gross-weight": grossWeight,
        "qty": qty,
        "packaging": packaging,
        "length": length,
        "width": width,
        "height": height,
      };
}
