// To parse this JSON data, do
//
//     final kategori = kategoriFromJson(jsonString);

part of 'model.dart';

Kategori kategoriFromJson(String str) => Kategori.fromJson(json.decode(str));

String kategoriToJson(Kategori data) => json.encode(data.toJson());

class Kategori {
  String status;
  String message;
  List<KategoriList> data;
  Pagination pagination;

  Kategori({
    required this.status,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
    status: json["status"],
    message: json["message"],
    data: List<KategoriList>.from(json["data"].map((x) => KategoriList.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class KategoriList {
  int id;
  String namaKategori;
  CreatedBy createdBy;
  dynamic updatedBy;

  KategoriList({
    required this.id,
    required this.namaKategori,
    required this.createdBy,
    required this.updatedBy,
  });

  factory KategoriList.fromJson(Map<String, dynamic> json) => KategoriList(
    id: json["id"],
    namaKategori: json["nama_kategori"],
    createdBy: CreatedBy.fromJson(json["created_by"]),
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_kategori": namaKategori,
    "created_by": createdBy.toJson(),
    "updated_by": updatedBy,
  };
}

class CreatedBy {
  int id;
  String nama;

  CreatedBy({
    required this.id,
    required this.nama,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["id"],
    nama: json["nama"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
  };
}

class Pagination {
  int total;
  int page;
  int pageSize;
  int totalPage;

  Pagination({
    required this.total,
    required this.page,
    required this.pageSize,
    required this.totalPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    page: json["page"],
    pageSize: json["pageSize"],
    totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "pageSize": pageSize,
    "total_page": totalPage,
  };
}
