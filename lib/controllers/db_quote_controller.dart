import 'package:get/get.dart';
import 'package:pr_7_db_miner/helpers/db_helper.dart';

class DBQuoteController extends GetxController {
  final RxList _allQuotes = [].obs;

  getAllQuotes() async {
    _allQuotes(await DBHelper.dbHelper.fetchQuote());
  }

  RxList get fetchQuote {
    return _allQuotes;
  }
}
