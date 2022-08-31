class ItemModel {
  ItemModel({
      this.message, 
      this.status, 
      this.data,});

  ItemModel.fromJson(dynamic json) {
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
ItemModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => ItemModel(  message: message ?? this.message,
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
      this.itemCode, 
      this.itemName, 
      this.itemStockId, 
      this.totalQty, 
      this.unitName,});

  Data.fromJson(dynamic json) {
    itemCode = json['itemCode'];
    itemName = json['itemName'];
    itemStockId = json['itemStockId'];
    totalQty = json['totalQty'];
    unitName = json['unitName'];
  }
  String? itemCode;
  String? itemName;
  String? itemStockId;
  num? totalQty;
  String? unitName;
Data copyWith({  String? itemCode,
  String? itemName,
  String? itemStockId,
  num? totalQty,
  String? unitName,
}) => Data(  itemCode: itemCode ?? this.itemCode,
  itemName: itemName ?? this.itemName,
  itemStockId: itemStockId ?? this.itemStockId,
  totalQty: totalQty ?? this.totalQty,
  unitName: unitName ?? this.unitName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['itemCode'] = itemCode;
    map['itemName'] = itemName;
    map['itemStockId'] = itemStockId;
    map['totalQty'] = totalQty;
    map['unitName'] = unitName;
    return map;
  }

}