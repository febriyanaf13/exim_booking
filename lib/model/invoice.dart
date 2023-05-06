import 'dart:convert';

List<Invoice> invoiceFromJson(List lst) =>
    List<Invoice>.from(lst.map((x) => Invoice.fromJson(x)));

String invoiceToJson(List<Invoice> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Invoice {
  Invoice({
    this.id,
    this.bookingId,
    this.activityId,
    this.cabangId,
    this.bankId,
    this.tglFaktur,
    this.fakturNumber,
    this.dppPajak,
    this.ppnPajak,
    this.masaLapor,
    this.invoiceNo,
    this.invDate,
    this.due,
    this.dateDue,
    this.sendDate,
    this.sendBy,
    this.collectionComments,
    this.refNo,
    this.countryOrigin,
    this.currencyId,
    this.rateId,
    this.currencyRate,
    this.hblNo,
    this.preview,
    this.marks,
    this.customerId,
    this.subjectName,
    this.account,
    this.memo,
    this.keterangan,
    this.top,
    this.status,
    this.sisaCicilan,
    this.pakePph,
    this.pph23,
    this.grandTotal,
    this.userCreated,
    this.approvalId,
    this.userVoid,
    this.voidDate,
    this.approvalDate,
    this.created,
    this.cicilanPph,
    this.statusTerimaPph,
    this.billToId,
    this.subjectBill,
    this.nilaiPph,
    this.customer,
    this.curr,
    this.invoiceCharge,
  });

  int? id;
  int? bookingId;
  int? activityId;
  int? cabangId;
  String? bankId;
  dynamic tglFaktur;
  dynamic fakturNumber;
  dynamic dppPajak;
  dynamic ppnPajak;
  dynamic masaLapor;
  String? invoiceNo;
  DateTime? invDate;
  String? due;
  DateTime? dateDue;
  dynamic sendDate;
  dynamic sendBy;
  dynamic collectionComments;
  dynamic refNo;
  String? countryOrigin;
  int? currencyId;
  int? rateId;
  String? currencyRate;
  dynamic hblNo;
  dynamic preview;
  dynamic marks;
  int? customerId;
  String? subjectName;
  dynamic account;
  dynamic memo;
  String? keterangan;
  String? top;
  String? status;
  String? sisaCicilan;
  dynamic pakePph;
  String? pph23;
  String? grandTotal;
  int? userCreated;
  dynamic approvalId;
  int? userVoid;
  String? voidDate;
  dynamic approvalDate;
  DateTime? created;
  String? cicilanPph;
  dynamic statusTerimaPph;
  int? billToId;
  String? subjectBill;
  String? nilaiPph;
  Customer? customer;
  Curr? curr;
  List<InvoiceCharge>? invoiceCharge;

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        id: json["id"],
        bookingId: json["booking_id"],
        activityId: json["activity_id"],
        cabangId: json["cabang_id"],
        bankId: json["bank_id"],
        tglFaktur: json["tgl_faktur"],
        fakturNumber: json["faktur_number"],
        dppPajak: json["dpp_pajak"],
        ppnPajak: json["ppn_pajak"],
        masaLapor: json["masa_lapor"],
        invoiceNo: json["invoice_no"],
        invDate: DateTime.parse(json["inv_date"]),
        due: json["due"],
        dateDue: DateTime.parse(json["date_due"]),
        sendDate: json["send_date"],
        sendBy: json["send_by"],
        collectionComments: json["collection_comments"],
        refNo: json["ref_no"],
        countryOrigin: json["country_origin"],
        currencyId: json["currency_id"],
        rateId: json["rate_id"],
        currencyRate: json["currency_rate"],
        hblNo: json["hbl_no"],
        preview: json["preview"],
        marks: json["marks"],
        customerId: json["customer_id"],
        subjectName: json["subject_name"],
        account: json["account"],
        memo: json["memo"],
        keterangan: json["keterangan"],
        top: json["top"],
        status: json["status"] ?? '',
        sisaCicilan: json["sisa_cicilan"],
        pakePph: json["pake_pph"],
        pph23: json["pph23"] ?? '',
        grandTotal: json["grand_total"],
        userCreated: json["user_created"],
        approvalId: json["approval_id"],
        userVoid: json["user_void"] ?? 0,
        voidDate: json["void_date"],
        approvalDate: json["approval_date"],
        created: DateTime.parse(json["created"]),
        cicilanPph: json["cicilan_pph"] ?? 'null',
        statusTerimaPph: json["status_terima_pph"],
        billToId: json["bill_to_id"],
        subjectBill: json["subject_bill"],
        nilaiPph: json["nilai_pph"],
        customer: Customer.fromJson(json["customer"]),
        curr: Curr.fromJson(json["curr"]),
        invoiceCharge: List<InvoiceCharge>.from(
            json["invoice_charge"].map((x) => InvoiceCharge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_id": bookingId,
        "activity_id": activityId,
        "cabang_id": cabangId,
        "bank_id": bankId,
        "tgl_faktur": tglFaktur,
        "faktur_number": fakturNumber,
        "dpp_pajak": dppPajak,
        "ppn_pajak": ppnPajak,
        "masa_lapor": masaLapor,
        "invoice_no": invoiceNo,
        "inv_date":
            "${invDate!.year.toString().padLeft(4, '0')}-${invDate!.month.toString().padLeft(2, '0')}-${invDate!.day.toString().padLeft(2, '0')}",
        "due": due,
        "date_due":
            "${dateDue!.year.toString().padLeft(4, '0')}-${dateDue!.month.toString().padLeft(2, '0')}-${dateDue!.day.toString().padLeft(2, '0')}",
        "send_date": sendDate,
        "send_by": sendBy,
        "collection_comments": collectionComments,
        "ref_no": refNo,
        "country_origin": countryOrigin,
        "currency_id": currencyId,
        "rate_id": rateId,
        "currency_rate": currencyRate,
        "hbl_no": hblNo,
        "preview": preview,
        "marks": marks,
        "customer_id": customerId,
        "subject_name": subjectName,
        "account": account,
        "memo": memo,
        "keterangan": keterangan,
        "top": top,
        "status": status ?? '',
        "sisa_cicilan": sisaCicilan,
        "pake_pph": pakePph,
        "pph23": pph23 ?? '',
        "grand_total": grandTotal,
        "user_created": userCreated,
        "approval_id": approvalId,
        "user_void": userVoid ?? '',
        "void_date": voidDate ?? '',
        "approval_date": approvalDate,
        "created": created,
        "cicilan_pph": cicilanPph ?? '',
        "status_terima_pph": statusTerimaPph,
        "bill_to_id": billToId,
        "subject_bill": subjectBill,
        "nilai_pph": nilaiPph,
        "customer": customer!.toJson(),
        "curr": curr!.toJson(),
        "invoice_charge":
            List<dynamic>.from(invoiceCharge!.map((x) => x.toJson())),
      };
}

class Curr {
  Curr({
    this.id,
    this.currency,
  });

  int? id;
  String? currency;

  factory Curr.fromJson(Map<String, dynamic> json) => Curr(
        id: json["id"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "currency": currency,
      };
}

class Customer {
  Customer({
    this.id,
    this.akunPayable,
    this.akunReceivable,
    this.corporate,
    this.codeCustomer,
    this.nama,
    this.industries,
    this.address,
    this.address1,
    this.email,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.phone1,
    this.phone2,
    this.fax,
    this.npwp,
    this.npwpName,
    this.npwpAddress,
    this.creditTerms,
    this.creditLimitsgd,
    this.note,
    this.label,
    this.picSales,
    this.handphone1,
    this.email1,
    this.picOperation,
    this.handphone2,
    this.email2,
    this.picAccounting,
    this.handphone3,
    this.email3,
    this.customers,
    this.shipper,
    this.agent,
    this.vendor,
    this.carrier,
    this.rc,
    this.other,
    this.agentVendor,
    this.cashAdvance,
    this.bookingPartyType,
    this.status,
    this.tax,
    this.billing,
    this.sendmail,
    this.keterangan,
    this.rounddown,
    this.stuffingPlace,
    this.userCreated,
    this.userModified,
    this.created,
    this.modified,
    this.bankId,
    this.bankDetail,
    this.customerGroupId,
    this.trucking,
    this.cabangId,
  });

  int? id;
  int? akunPayable;
  int? akunReceivable;
  String? corporate;
  String? codeCustomer;
  String? nama;
  String? industries;
  String? address;
  dynamic address1;
  dynamic email;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  String? phone1;
  String? phone2;
  String? fax;
  String? npwp;
  String? npwpName;
  String? npwpAddress;
  String? creditTerms;
  String? creditLimitsgd;
  String? note;
  String? label;
  String? picSales;
  String? handphone1;
  dynamic email1;
  String? picOperation;
  String? handphone2;
  dynamic email2;
  String? picAccounting;
  String? handphone3;
  dynamic email3;
  String? customers;
  String? shipper;
  dynamic agent;
  String? vendor;
  String? carrier;
  dynamic rc;
  dynamic other;
  dynamic agentVendor;
  dynamic cashAdvance;
  String? bookingPartyType;
  String? status;
  String? tax;
  dynamic billing;
  dynamic sendmail;
  dynamic keterangan;
  dynamic rounddown;
  dynamic stuffingPlace;
  int? userCreated;
  int? userModified;
  DateTime? created;
  DateTime? modified;
  int? bankId;
  String? bankDetail;
  dynamic customerGroupId;
  dynamic trucking;
  dynamic cabangId;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        akunPayable: json["akun_payable"],
        akunReceivable: json["akun_receivable"],
        corporate: json["corporate"],
        codeCustomer: json["code_customer"],
        nama: json["nama"],
        industries: json["industries"],
        address: json["address"],
        address1: json["address1"],
        email: json["email"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postalCode: json["postal_code"] ?? '',
        phone1: json["phone1"],
        phone2: json["phone2"] ?? '',
        fax: json["fax"],
        npwp: json["npwp"],
        npwpName: json["npwp_name"],
        npwpAddress: json["npwp_address"],
        creditTerms: json["credit_terms"],
        creditLimitsgd: json["credit_limitsgd"],
        note: json["note"],
        label: json["label"],
        picSales: json["pic_sales"] ?? '',
        handphone1: json["handphone1"] ?? '',
        email1: json["email1"],
        picOperation: json["pic_operation"] ?? '',
        handphone2: json["handphone2"] ?? '',
        email2: json["email2"],
        picAccounting: json["pic_accounting"] ?? '',
        handphone3: json["handphone3"] ?? '',
        email3: json["email3"],
        customers: json["customers"],
        shipper: json["shipper"],
        agent: json["agent"],
        vendor: json["vendor"],
        carrier: json["carrier"] ?? '',
        rc: json["rc"],
        other: json["other"],
        agentVendor: json["agent_vendor"],
        cashAdvance: json["cash_advance"],
        bookingPartyType: json["booking_party_type"],
        status: json["status"],
        tax: json["tax"],
        billing: json["billing"],
        sendmail: json["sendmail"],
        keterangan: json["keterangan"],
        rounddown: json["rounddown"],
        stuffingPlace: json["stuffing_place"],
        userCreated: json["user_created"],
        userModified: json["user_modified"],
        created: DateTime.parse(json["created"]),
        modified: DateTime.parse(json["modified"]),
        bankId: json["bank_id"] ?? 0,
        bankDetail: json["bank_detail"] ?? '',
        customerGroupId: json["customer_group_id"],
        trucking: json["trucking"],
        cabangId: json["cabang_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "akun_payable": akunPayable,
        "akun_receivable": akunReceivable,
        "corporate": corporate,
        "code_customer": codeCustomer,
        "nama": nama,
        "industries": industries,
        "address": address,
        "address1": address1,
        "email": email,
        "city": city,
        "state": state,
        "country": country,
        "postal_code": postalCode ?? '',
        "phone1": phone1,
        "phone2": phone2 ?? '',
        "fax": fax,
        "npwp": npwp,
        "npwp_name": npwpName,
        "npwp_address": npwpAddress,
        "credit_terms": creditTerms,
        "credit_limitsgd": creditLimitsgd,
        "note": note,
        "label": label,
        "pic_sales": picSales ?? '',
        "handphone1": handphone1 ?? '',
        "email1": email1,
        "pic_operation": picOperation ?? '',
        "handphone2": handphone2 ?? '',
        "email2": email2,
        "pic_accounting": picAccounting ?? '',
        "handphone3": handphone3 ?? '',
        "email3": email3,
        "customers": customers,
        "shipper": shipper,
        "agent": agent,
        "vendor": vendor,
        "carrier": carrier ?? '',
        "rc": rc,
        "other": other,
        "agent_vendor": agentVendor,
        "cash_advance": cashAdvance,
        "booking_party_type": bookingPartyType,
        "status": status,
        "tax": tax,
        "billing": billing,
        "sendmail": sendmail,
        "keterangan": keterangan,
        "rounddown": rounddown,
        "stuffing_place": stuffingPlace,
        "user_created": userCreated,
        "user_modified": userModified,
        "created": created,
        "modified": modified,
        "bank_id": bankId ?? '',
        "bank_detail": bankDetail ?? '',
        "customer_group_id": customerGroupId,
        "trucking": trucking,
        "cabang_id": cabangId,
      };
}

class InvoiceCharge {
  InvoiceCharge({
    this.id,
    this.invoiceId,
    this.bookchargeId,
    this.tax,
    this.chargeId,
    this.charge,
    this.chargeMemo,
    this.currencyId,
    this.rateId,
    this.currencyRate,
    this.qty,
    this.priceUnit,
    this.priceTotal,
    this.top,
    this.kategori,
  });

  int? id;
  int? invoiceId;
  int? bookchargeId;
  String? tax;
  int? chargeId;
  dynamic charge;
  dynamic chargeMemo;
  int? currencyId;
  dynamic rateId;
  String? currencyRate;
  String? qty;
  String? priceUnit;
  String? priceTotal;
  String? top;
  String? kategori;

  factory InvoiceCharge.fromJson(Map<String, dynamic> json) => InvoiceCharge(
        id: json["id"],
        invoiceId: json["invoice_id"],
        bookchargeId: json["bookcharge_id"],
        tax: json["tax"],
        chargeId: json["charge_id"],
        charge: json["charge"],
        chargeMemo: json["charge_memo"],
        currencyId: json["currency_id"],
        rateId: json["rate_id"],
        currencyRate: json["currency_rate"],
        qty: json["qty"],
        priceUnit: json["price_unit"],
        priceTotal: json["price_total"],
        top: json["top"],
        kategori: json["kategori"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "invoice_id": invoiceId,
        "bookcharge_id": bookchargeId,
        "tax": tax,
        "charge_id": chargeId,
        "charge": charge,
        "charge_memo": chargeMemo,
        "currency_id": currencyId,
        "rate_id": rateId,
        "currency_rate": currencyRate,
        "qty": qty,
        "price_unit": priceUnit,
        "price_total": priceTotal,
        "top": top,
        "kategori": kategori,
      };
}
