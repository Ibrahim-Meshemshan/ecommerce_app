class CategoryResponseOrBrandEntity {
  CategoryResponseOrBrandEntity(
      {this.results, this.data, this.message, this.statusMsg});

  num? results;
  List<CategoryOrBrandEntity>? data;
  String? statusMsg;
  String? message;
}

class CategoryOrBrandEntity {
  CategoryOrBrandEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
}
