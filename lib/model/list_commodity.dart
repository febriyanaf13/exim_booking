class ListCommodity {
  ListCommodity({
    this.id,
    this.namacommodity,
    this.statuscommodity,
    this.hscode,
    this.imoclass,
    this.unnumber,
    this.commodityId,
  });

  int? id;
  String? commodityId;
  String? namacommodity;
  bool? statuscommodity;
  dynamic hscode;
  dynamic imoclass;
  dynamic unnumber;

  factory ListCommodity.fromJson(Map<String, dynamic> json) => ListCommodity(
        namacommodity: json["commodity"],
        hscode: json["hs-code"],
        statuscommodity: json["dangerous"],
        imoclass: json["imo-class"],
        unnumber: json["un-number"],
      );

      
  Map<String, dynamic> toJson() => {
        "commodity": namacommodity,
        "hs-code": hscode,
        "dangerous": statuscommodity,
        "imo-class": imoclass,
        "un-number": unnumber,
      };
}
