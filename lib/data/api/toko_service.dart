import 'package:dio/dio.dart';

import '../model/model.dart';

class TokoService {
  static const _baseUrl = 'http://localhost:8080';
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwibmFtYSI6ImhpbG1pIHNhamFsYWgiLCJlbWFpbCI6ImhpbG1pQGdtYWlsLmNvbSIsImlhdCI6MTcxMDgxODA3NiwiZXhwIjoxNzEwOTA0NDc2fQ.JJCWPUrXDENMhj0ava4JmMNDDDOpHBMWIvbrzlLYRsw';
  final Dio dio = Dio();

  Future<Kategori> getKategori() async {
    final response = await dio.get(
      '$_baseUrl/kategori/list',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (response.statusCode == 200) {
      print(response.data);
      return Kategori.fromJson(response.data);
    } else {
      throw Exception('Failed To Fetch Kategori Data');
    }
  }

  Future<Produk> getProduk() async {
    final response = await dio.get(
      '$_baseUrl/produk/list',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (response.statusCode == 200) {
      print(response.data);
      return Produk.fromJson(response.data);
    } else {
      throw Exception('Failed To Fetch Produk Data');
    }
  }
}
