import '../../Domain_layer/Entities/CategoryResponseOrBrandEntity.dart';

class CategoryOrBrandResponseDto extends CategoryResponseOrBrandEntity {
  CategoryOrBrandResponseDto(
      {super.results, super.data, super.message, super.statusMsg});


  CategoryOrBrandResponseDto.fromJson(dynamic json) {
    message = json["message"];
    statusMsg = json["statusMsg"];
    results = json['results'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandDto.fromJson(v));
      });
    }
  }
}

class CategoryOrBrandDto extends CategoryOrBrandEntity {
  CategoryOrBrandDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });



  CategoryOrBrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}
