class HistoryModel {
  final int? id;
  final int? productId;
  final String ?productName;
  final int? amount;
  final String ?dateCreate;
  final String? dateUpdate;

  HistoryModel({
     this.id,
     this.productId,
     this.productName,
     this.amount,
     this.dateCreate,
     this.dateUpdate,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'] ,
      productId: json['product_id'],
      productName: json['product_name'] ,
      amount: json['amount'] ,
      dateCreate: json['date_create'] ,
      dateUpdate: json['date_update'] ,
    );
  }
}
