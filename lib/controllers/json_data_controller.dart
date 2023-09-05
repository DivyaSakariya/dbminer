import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/modals/quote_modal.dart';

class JsonDataController extends GetxController {
  List allQuotesData = [];
  RxList allFavorite = [].obs;
  bool isFavorite = false;


  Future<void> loadData() async {
    String jsonData = await rootBundle.loadString('assets/json/quotes.json');
    List allData = json.decode(jsonData);
    allQuotesData = allData.map((e) => QuoteModal.fromMap(data: e)).toList();
  }

  checkFavorite() {
    isFavorite = !isFavorite;
    update();
  }

  onFavoriteTapped({required QuoteModal data}) {
    allFavorite.add(data);
  }

  delete({required int index}) {
    allFavorite.removeAt(index);
  }

}
