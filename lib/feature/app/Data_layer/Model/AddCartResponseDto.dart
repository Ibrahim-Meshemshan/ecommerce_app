import 'package:e_commerce/feature/app/Domain_layer/Entities/AddCartResponseEntity.dart';

class AddCartResponseDto extends AddCartResponseEntity{
  AddCartResponseDto({
      super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  AddCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddCartDto.fromJson(json['data']) : null;
  }


  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (data != null) {
      map['data'] = {
        'id': data?.id,
        'cartOwner': data?.cartOwner,
        'products': data?.products,
        'createdAt': data?.createdAt,
        'updatedAt': data?.updatedAt,
        'totalCartPrice': data?.totalCartPrice,
      };
    }
    return map;
  }


}

class AddCartDto extends AddCartEntity{
  AddCartDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,});

  AddCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    map['products'] = products;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }

}

class AddProductDto extends AddProductEntity{
  AddProductDto({
    super.count,
    super.id,
    super.product,
    super.price,});

  AddProductDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }

}