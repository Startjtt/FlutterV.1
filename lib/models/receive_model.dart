class ReceiveModel {
  ReceiveModel({
      this.message, 
      this.status, 
      this.data,});

  ReceiveModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? message;
  num? status;
  List<Data>? data;
ReceiveModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => ReceiveModel(  message: message ?? this.message,
  status: status ?? this.status,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.paySubId, 
      this.payDetailId, 
      this.usageCode, 
      this.itemCode, 
      this.itemName, 
      this.qrCode, 
      this.itemStockId, 
      this.occurId, 
      this.payDate, 
      this.receiveDate, 
      this.paySubStatus, 
      this.receiveQty, 
      this.tmpQty, 
      this.totalQty, 
      this.selected,});

  Data.fromJson(dynamic json) {
    paySubId = json['paySubId'];
    payDetailId = json['payDetailId'];
    usageCode = json['usageCode'];
    itemCode = json['itemCode'];
    itemName = json['itemName'];
    qrCode = json['qrCode'];
    itemStockId = json['itemStockId'];
    occurId = json['occurId'];
    payDate = json['payDate'];
    receiveDate = json['receiveDate'];
    paySubStatus = json['paySubStatus'];
    receiveQty = json['receiveQty'];
    tmpQty = json['tmpQty'];
    totalQty = json['totalQty'];
    selected = json['selected'];
  }
  String? paySubId;
  String? payDetailId;
  String? usageCode;
  String? itemCode;
  String? itemName;
  String? qrCode;
  String? itemStockId;
  num? occurId;
  String? payDate;
  String? receiveDate;
  num? paySubStatus;
  num? receiveQty;
  num? tmpQty;
  num? totalQty;
  num? selected;
Data copyWith({  String? paySubId,
  String? payDetailId,
  String? usageCode,
  String? itemCode,
  String? itemName,
  String? qrCode,
  String? itemStockId,
  num? occurId,
  String? payDate,
  String? receiveDate,
  num? paySubStatus,
  num? receiveQty,
  num? tmpQty,
  num? totalQty,
  num? selected,
}) => Data(  paySubId: paySubId ?? this.paySubId,
  payDetailId: payDetailId ?? this.payDetailId,
  usageCode: usageCode ?? this.usageCode,
  itemCode: itemCode ?? this.itemCode,
  itemName: itemName ?? this.itemName,
  qrCode: qrCode ?? this.qrCode,
  itemStockId: itemStockId ?? this.itemStockId,
  occurId: occurId ?? this.occurId,
  payDate: payDate ?? this.payDate,
  receiveDate: receiveDate ?? this.receiveDate,
  paySubStatus: paySubStatus ?? this.paySubStatus,
  receiveQty: receiveQty ?? this.receiveQty,
  tmpQty: tmpQty ?? this.tmpQty,
  totalQty: totalQty ?? this.totalQty,
  selected: selected ?? this.selected,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['paySubId'] = paySubId;
    map['payDetailId'] = payDetailId;
    map['usageCode'] = usageCode;
    map['itemCode'] = itemCode;
    map['itemName'] = itemName;
    map['qrCode'] = qrCode;
    map['itemStockId'] = itemStockId;
    map['occurId'] = occurId;
    map['payDate'] = payDate;
    map['receiveDate'] = receiveDate;
    map['paySubStatus'] = paySubStatus;
    map['receiveQty'] = receiveQty;
    map['tmpQty'] = tmpQty;
    map['totalQty'] = totalQty;
    map['selected'] = selected;
    return map;
  }

}