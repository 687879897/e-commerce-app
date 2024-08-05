class GetProductResponse {
  final int? results;
  final Metadata? metadata;
  final List<ProductDM>? data;

  GetProductResponse({this.results, this.metadata, this.data});

  factory GetProductResponse.fromJson(Map<String, dynamic> json) {
    return GetProductResponse(
      results: json['results'],
      metadata: json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null,
      data: json['data'] != null ? (json['data'] as List).map((v) => ProductDM.fromJson(v)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'results': this.results,
      if (metadata != null) 'metadata': metadata!.toJson(),
      if (this.data != null) 'data': this.data!.map((v) => v.toJson()).toList(),
    };
    return data;
  }
}

class Metadata {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;
  final int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
      nextPage: json['nextPage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'numberOfPages': numberOfPages,
      'limit': limit,
      'nextPage': nextPage,
    };
  }
}

class ProductDM {
  final int? sold;
  final List<String>? images;
  final List<Subcategory>? subcategory;
  final int? ratingsQuantity;
  final String? sId;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final Category? category;
  final Category? brand;
  final double? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;
  final String? id;
  final int? priceAfterDiscount;
  final List<String>? availableColors;

  ProductDM({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.sId,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.priceAfterDiscount,
    this.availableColors,
  });

  factory ProductDM.fromJson(Map<String, dynamic> json) {
    return ProductDM(
      sold: json['sold'],
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      subcategory: json['subcategory'] != null
          ? (json['subcategory'] as List).map((v) => Subcategory.fromJson(v)).toList()
          : null,
      ratingsQuantity: json['ratingsQuantity'],
      sId: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'],
      imageCover: json['imageCover'],
      category: json['category'] != null ? Category.fromJson(json['category']) : null,
      brand: json['brand'] != null ? Category.fromJson(json['brand']) : null,
      ratingsAverage: (json['ratingsAverage'] is int)
          ? (json['ratingsAverage'] as int).toDouble()
          : json['ratingsAverage'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      id: json['id'],
      priceAfterDiscount: json['priceAfterDiscount'],
      availableColors: json['availableColors'] != null ? List<String>.from(json['availableColors']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sold'] = sold;
    data['images'] = images;
    if (subcategory != null) data['subcategory'] = subcategory!.map((v) => v.toJson()).toList();
    data['ratingsQuantity'] = ratingsQuantity;
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['quantity'] = quantity;
    data['price'] = price;
    data['imageCover'] = imageCover;
    if (category != null) data['category'] = category!.toJson();
    if (brand != null) data['brand'] = brand!.toJson();
    data['ratingsAverage'] = ratingsAverage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    data['priceAfterDiscount'] = priceAfterDiscount;
    if (availableColors != null) data['availableColors'] = availableColors;
    return data;
  }
}


class Subcategory {
  final String? sId;
  final String? name;
  final String? slug;
  final String? category;

  Subcategory({this.sId, this.name, this.slug, this.category});

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      sId: json['_id'],
      name: json['name'],
      slug: json['slug'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'name': name,
      'slug': slug,
      'category': category,
    };
  }
}

class Category {
  final String? sId;
  final String? name;
  final String? slug;
  final String? image;

  Category({this.sId, this.name, this.slug, this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      sId: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'name': name,
      'slug': slug,
      'image': image,
    };
  }
}
