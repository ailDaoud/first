import 'dart:convert';

GetCategory getCategoryFromJson(String str) =>
    GetCategory.fromJson(json.decode(str));

String getCategoryToJson(GetCategory data) => json.encode(data.toJson());

class GetCategory {
  List<Category> categories;

  GetCategory({
    required this.categories,
  });

  factory GetCategory.fromJson(Map<String, dynamic> json) => GetCategory(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  int id;
  String name;
  String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
