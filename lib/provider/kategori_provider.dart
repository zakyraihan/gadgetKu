import 'package:flutter/material.dart';
import 'package:gadgetku/data/api/toko_service.dart';
import 'package:gadgetku/data/common/resultstate.dart';
import 'package:gadgetku/data/model/model.dart';


class KategoriProvider extends ChangeNotifier {
  final TokoService apiService;
  String query = '';

  KategoriProvider({required this.apiService}) {
    fetchAllData();
  }

  late Kategori _kategoriResult;
  late ResultState _state;
  String _message = '';

  Kategori get result => _kategoriResult;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> fetchAllData() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final kategori = await apiService.getKategori();
      if (kategori.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'empty data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _kategoriResult = kategori;
      }
    } catch (e) {
      print(e);
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Terjadi Kesalahan';
    }
  }
}
