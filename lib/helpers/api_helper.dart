import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pr_7_db_miner/modals/quote_modal.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  getApiQuotes() async {
    String api = "https://api.api-ninjas.com/v1/quotes?limit=10&category=love";

    http.Response response = await http.get(Uri.parse(api),
        headers: {'X-Api-Key': 'Ue3InVm3/Z2nxdmCEtAdvQ==Jyg2JoB23dV4ZY3n'});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      // QuoteModal allData = QuoteModal.fromMap(data: data);
      //
      // log("$allData");

      return data;
    }
    return null;
  }
}
