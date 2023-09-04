import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/modals/quote_modal.dart';

class ApiController extends GetxController {
  // late RxList allQuotes = [].obs;
  //
  // fetchApiQuotes() async {
  //   allQuotes = (await ApiHelper.apiHelper.getApiQuotes()) as RxList;
  // }

  List allQuotesData = [];

  Future<void> loadData() async {
    String jsonData = await rootBundle.loadString('assets/json/quotes.json');
    List allData = json.decode(jsonData);
    allQuotesData = allData.map((e) => QuoteModal.fromMap(data: e)).toList();
  }

  checkIsFavrouite({required int index}) {
    allQuotesData[index].favrouite = !allQuotesData[index].favrouite;
    update();
  }
}
