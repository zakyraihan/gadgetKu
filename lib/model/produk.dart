// To parse this JSON data, do
//
//     final produk = produkFromJson(jsonString);

part of 'model.dart';

List<Produk> produkFromJson(String str) =>
    List<Produk>.from(json.decode(str).map((x) => Produk.fromJson(x)));

String produkToJson(List<Produk> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Produk {
  int id;
  String title;
  int price;
  String description;
  List<String> images;
  DateTime creationAt;
  DateTime updatedAt;
  Kategori category;

  Produk({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        category: Kategori.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "category": category.toJson(),
      };
}

enum Name { CLOTHESS, ELECTRONICS, MISCELLANEOUS, SHOES, TRAINING }

final nameValues = EnumValues({
  "Clothess": Name.CLOTHESS,
  "Electronics": Name.ELECTRONICS,
  "Miscellaneous": Name.MISCELLANEOUS,
  "Shoes": Name.SHOES,
  "training": Name.TRAINING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
