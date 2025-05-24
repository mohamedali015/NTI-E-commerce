class CategoriesResponse {
  List<CategoriesModel>? categories;
  bool? status;

  CategoriesResponse({this.categories, this.status});

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <CategoriesModel>[];
      json['categories'].forEach((v) {
        categories!.add(CategoriesModel.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class CategoriesModel {
  String? description;
  int? id;
  String? imagePath;
  List<dynamic>? products;
  String? title;

  CategoriesModel({
    this.description,
    this.id,
    this.imagePath,
    this.products,
    this.title,
  });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    imagePath = json['image_path'];
    products = json['products'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['id'] = id;
    data['image_path'] = imagePath;
    data['products'] = products;
    data['title'] = title;
    return data;
  }
}
