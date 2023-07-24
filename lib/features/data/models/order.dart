class MyOrder {
  final String orderId;
  final String addressID;
  final double totalAmount;
  final String orderBy;
  final List<String> productIDs;
  final String paymentDetails;
  final String orderTime;
  final bool isSuccess;
  final String sellerUID;
  final String riderUID;
  final String status;

  MyOrder({
    required this.orderId,
    required this.addressID,
    required this.totalAmount,
    required this.orderBy,
    required this.productIDs,
    required this.paymentDetails,
    required this.orderTime,
    required this.isSuccess,
    required this.sellerUID,
    required this.riderUID,
    required this.status,
  });

  factory MyOrder.fromJson(Map<String, dynamic> json) {
    return MyOrder(
      orderId: json['orderId'],
      addressID: json['addressID'],
      totalAmount: json['totalAmount'],
      orderBy: json['orderBy'],
      productIDs: List<String>.from(json['productIDs']),
      paymentDetails: json['paymentDetails'],
      orderTime: json['orderTime'],
      isSuccess: json['isSuccess'],
      sellerUID: json['sellerUID'],
      riderUID: json['riderUID'],
      status: json['status'],
    );
  }
}