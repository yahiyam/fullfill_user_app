import 'package:cloud_firestore/cloud_firestore.dart';

class Categories {
  String? menuID;
  String? sellerUID;
  String? menuTitle;
  String? menuInfo;
  Timestamp? publishedDate;
  String? thumbnailUrl;
  String? status;

  Categories({
    this.menuID,
    this.sellerUID,
    this.menuTitle,
    this.menuInfo,
    this.publishedDate,
    this.thumbnailUrl,
    this.status,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    menuID = json["menuID"];
    sellerUID = json['sellerUID'];
    menuTitle = json['menuTitle'];
    menuInfo = json['menuInfo'];
    publishedDate = json['publishedDate'];
    thumbnailUrl = json['thumbnailUrl'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["menuID"] = menuID;
    data['sellerUID'] = sellerUID;
    data['menuTitle'] = menuTitle;
    data['menuInfo'] = menuInfo;
    data['publishedDate'] = publishedDate;
    data['thumbnailUrl'] = thumbnailUrl;
    data['status'] = status;

    return data;
  }
}
