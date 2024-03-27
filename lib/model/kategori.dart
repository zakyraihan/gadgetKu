// To parse this JSON data, do
//
//     final kategori = kategoriFromJson(jsonString);

part of 'model.dart';

List<Kategori> kategoriFromJson(String str) =>
    List<Kategori>.from(json.decode(str).map((x) => Kategori.fromJson(x)));

String kategoriToJson(List<Kategori> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kategori {
  int id;
  String name;
  String image;
  DateTime creationAt;
  DateTime updatedAt;

  Kategori({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
