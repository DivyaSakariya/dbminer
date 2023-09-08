import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:pr_7_db_miner/controllers/quotes_controller.dart';
import 'package:pr_7_db_miner/helpers/db_helper.dart';

import '../modals/quote_modal.dart';

class JsonDataController extends GetxController {
  List allQuotesData = [];
  List quotesList = [];
  RxList allFavorite = [].obs;
  RxList searchQuotes = [].obs;
  RxString searchValue = ''.obs;
  RxBool isFavorite = false.obs;

  QuoteModal quoteModal = QuoteModal.init();

  loadData() async {
    String jsonData = await rootBundle.loadString('assets/json/quotes.json');
    List allData = json.decode(jsonData);
    allQuotesData = allData.map((e) => QuoteModal.fromMap(data: e)).toList();
  }

  checkFavorite() {
    isFavorite(!isFavorite.value);
  }

  onFavoriteTapped({required QuoteModal data}) {
    allFavorite.add(data);
  }

  delete({required int index}) {
    allFavorite.removeAt(index);
  }

  search({required String value}) {
    final item = allQuotesData.firstWhere((e) => e['quote'] == value);
    log(item['quote']);
    // searchValue(value);
    //
    // for (int i = 0; i <= allQuotesData.length; i++) {
    //   if (searchValue == allQuotesData[i]) {
    //     return searchQuotes = allQuotesData[i];
    //   } else {
    //     return 'No result found';
    //   }
    // }
  }
}
