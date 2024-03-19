// To parse this JSON data, do
//
//     final produk = produkFromJson(jsonString);

import 'dart:convert';

Produk produkFromJson(String str) => Produk.fromJson(json.decode(str));

String produkToJson(Produk data) => json.encode(data.toJson());

class Produk {
  String status;
  String message;
  List<ProdukList> data;
  Pagination pagination;

  Produk({
    required this.status,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        status: json["status"],
        message: json["message"],
        data: List<ProdukList>.from(json["data"].map((x) => ProdukList.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class ProdukList {
  int id;
  String namaProduk;
  String deskripsiProduk;
  double harga;
  int stok;
  AtedBy createdBy;
  AtedBy? updatedBy;
  Kategori kategori;

  ProdukList({
    required this.id,
    required this.namaProduk,
    required this.deskripsiProduk,
    required this.harga,
    required this.stok,
    required this.createdBy,
    required this.updatedBy,
    required this.kategori,
  });

  factory ProdukList.fromJson(Map<String, dynamic> json) => ProdukList(
        id: json["id"],
        namaProduk: json["nama_produk"],
        deskripsiProduk: json["deskripsi_produk"],
        harga: json["harga"]?.toDouble(),
        stok: json["stok"],
        createdBy: AtedBy.fromJson(json["created_by"]),
        updatedBy: json["updated_by"] == null
            ? null
            : AtedBy.fromJson(json["updated_by"]),
        kategori: Kategori.fromJson(json["kategori"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_produk": namaProduk,
        "deskripsi_produk": deskripsiProduk,
        "harga": harga,
        "stok": stok,
        "created_by": createdBy.toJson(),
        "updated_by": updatedBy?.toJson(),
        "kategori": kategori.toJson(),
      };
}

class AtedBy {
  int id;
  String nama;

  AtedBy({
    required this.id,
    required this.nama,
  });

  factory AtedBy.fromJson(Map<String, dynamic> json) => AtedBy(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}

class Kategori {
  int id;
  String namaKategori;

  Kategori({
    required this.id,
    required this.namaKategori,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        id: json["id"],
        namaKategori: json["nama_kategori"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kategori": namaKategori,
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
