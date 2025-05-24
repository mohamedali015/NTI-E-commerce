class SliderResponse {
  List<SliderModel>? sliders;
  bool? status;

  SliderResponse({this.sliders, this.status});

  SliderResponse.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <SliderModel>[];
      json['sliders'].forEach((v) {
        sliders!.add(SliderModel.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (sliders != null) {
      data['sliders'] = sliders!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class SliderModel {
  String? description;
  int? id;
  String? imagePath;
  String? title;

  SliderModel({this.description, this.id, this.imagePath, this.title});

  SliderModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    imagePath = json['image_path'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['id'] = id;
    data['image_path'] = imagePath;
    data['title'] = title;
    return data;
  }
}
