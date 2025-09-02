class UserModel {
  String? email;
  List<dynamic>? favoriteProducts;
  int? id;
  String? imagePath;
  String? name;
  String? phone;

  UserModel({
    this.email,
    this.favoriteProducts,
    this.id,
    this.imagePath,
    this.name,
    this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    favoriteProducts = json['favorite_products'] ?? [];
    id = json['id'];
    imagePath = json['image_path'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['favorite_products'] = favoriteProducts ?? [];
    data['id'] = id;
    data['image_path'] = imagePath;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}
