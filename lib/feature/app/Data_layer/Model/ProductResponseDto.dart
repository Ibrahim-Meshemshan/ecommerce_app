import 'package:e_commerce/feature/app/Data_layer/Model/CategoryOrBrandResponseDto.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/ProductResponseEntity.dart';

class ProductResponseDto extends ProductResponseEntity {
  ProductResponseDto({
    super.results,
    this.metadata,
    super.data,
    this.message,
    this.statusMsg,
  });

  ProductResponseDto.fromJson(dynamic json) {
    message = json["message"];
    statusMsg = json["statusMsg"];
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDto.fromJson(v));
      });
    }
  }

  Metadata? metadata;
  String? message;
  String? statusMsg;
}

class ProductDto extends ProductEntity {
  ProductDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  ProductDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryOrBrandDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? CategoryOrBrandDto.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  String? createdAt;
  String? updatedAt;
}

class SubcategoryDto extends SubcategoryEntity {
  SubcategoryDto({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  SubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }
}

class Metadata {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }

  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    map['nextPage'] = nextPage;
    return map;
  }
}
