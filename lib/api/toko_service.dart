import 'package:gadgetku/model/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future getKategori() async {
    String url =
        "https://api.escuelajs.co/api/v1/categories/?q=89520ffcbc42737cffc26b0ff788794ba";
    Uri urlData = Uri.parse(url);

    final respon = await http.get(urlData);

    if (respon.statusCode == 200) {
      var data = kategoriFromJson(respon.body);
      return data;
    } else {
      throw Exception('gagal mengambil data');
    }
  }

  Future getProduk(String categoryId) async {
    String url =
        "https://api.escuelajs.co/api/v1/products/?q=89520ffcbc42737cffc26b0ff788794ba&categoryId=$categoryId";
    Uri urlData = Uri.parse(url);

    final respon = await http.get(urlData);

    if (respon.statusCode == 200) {
      var data = produkFromJson(respon.body);
      return data;
    } else {
      throw Exception('gagal mengambil data');
    }
  }

  Future getAllProduk(
      String title, String categoryId, int priceMin, int priceMax) async {
    String url =
        "https://api.escuelajs.co/api/v1/products/?q=89520ffcbc42737cffc26b0ff788794ba&title=$title&categoryId=$categoryId&price_min=$priceMin&price_max=$priceMax";
    Uri urlData = Uri.parse(url);

    final respon = await http.get(urlData);

    if (respon.statusCode == 200) {
      var data = produkFromJson(respon.body);
      return data;
    } else {
      throw Exception('gagal mengambil data');
    }
  }
}
