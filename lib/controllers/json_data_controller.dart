import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:pr_7_db_miner/controllers/quotes_controller.dart';

import '../modals/quote_modal.dart';

class JsonDataController extends GetxController {
  List allQuotesData = [];
  List quotesList = [];
  RxList allFavorite = [].obs;
  RxList searchQuotes = [].obs;
  RxString searchValue = ''.obs;
  bool isFavorite = false;

  QuoteModal quoteModal = QuoteModal.init();

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

  search({required String query}) {
    // searchQuotes = quoteModal.quote.
    // .where((item) => item.toLowerCase().contains(query.toLowerCase()))
    // .toList();
    // });

    // final item = myList.firstWhere((e) => e['amount'] == '12500' && e['caliber'] == '24');
    // print(item['maturity']);
  }
}
