import 'get-product-response.dart';
import 'prouductresponse.dart';

class CartResponse {
  String? status;
  int? numOfCartItems;
  CartDm? data;

  CartResponse({this.status, this.numOfCartItems, this.data});

  CartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? new CartDm.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['numOfCartItems'] = this.numOfCartItems;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CartDm {
  String? sId;
  String? cartOwner;
  List<CartProduectDeatils>? products;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? totalCartPrice;

  CartDm(
      {this.sId,
        this.cartOwner,
        this.products,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.totalCartPrice});

  CartDm.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null && json['products'] is List) {
      products = (json['products'] as List).map((v) => CartProduectDeatils.fromJson(v)).toList();
    } else {
      products = [];
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['cartOwner'] = cartOwner;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['totalCartPrice'] = totalCartPrice;
    return data;
  }
}

class CartProduectDeatils {
  int? count;
  String? sId;
  ProductDM? product;
  int? price;

  CartProduectDeatils({this.count, this.sId, this.product, this.price});

  CartProduectDeatils.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product = json['product'] != null ? ProductDM.fromJson(json['product']) : null;
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['count'] = count;
    data['_id'] = sId;
    if (product != null) data['product'] = product!.toJson();
    data['price'] = price;
    return data;
  }
}


class Subcategory {
  String? sId;
  String? name;
  String? slug;
  String? category;

  Subcategory({this.sId, this.name, this.slug, this.category});

  Subcategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['category'] = this.category;
    return data;
  }
}




