import 'package:flutter/material.dart';
import 'package:gadgetku/data/api/toko_service.dart';
import 'package:gadgetku/data/common/resultstate.dart';
import 'package:gadgetku/data/model/model.dart';


class ProdukProvider extends ChangeNotifier {
  final TokoService apiService;
  String query = '';

  ProdukProvider({required this.apiService}) {
    fetchAllData();
  }

  late Produk _produkResult;
  late ResultState _state;
  String _message = '';

  Produk get result => _produkResult;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> fetchAllData() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final produk = await apiService.getProduk();
      if (produk.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'empty data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _produkResult = produk;
      }
    } catch (e) {
      print(e);
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Terjadi Kesalahan';
    }
  }
}
