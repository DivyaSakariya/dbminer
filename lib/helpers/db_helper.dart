import 'dart:developer';

import 'package:path/path.dart';
import 'package:pr_7_db_miner/modals/quote_modal.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  late Database database;

  String tableQuotes = "QuotesTable";

  String qId = "id";
  String qQuote = "quote";
  String qAuthor = "author";

  init() async {
    log("DB Initializing");

    String dbPath = await getDatabasesPath();
    String dbFileName = "quoteDB1.db";

    String path = join(dbPath, dbFileName);

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, _) {
        log("DB Creating table !!");

        db
            .execute(
                'CREATE TABLE IF NOT EXISTS $tableQuotes($qId INTEGER PRIMARY KEY AUTOINCREMENT, $qQuote TEXT, $qAuthor TEXT)')
            .then((value) {
          log("Table created...");
        }).onError((error, stackTrace) {
          log("ERROR: $error");
        });
      },
    );
    log("DB path: ${database.path}");
    log("Initialized...");
  }

  Future<int> insertQuote({required QuoteModal quoteModal}) async {
    String query =
        'INSERT INTO $tableQuotes($qQuote, $qAuthor) VALUES(?, ?)';

    List args = [
      quoteModal.quote,
      quoteModal.author,
    ];

    return await database.rawInsert(query, args);
  }

  Future<List> fetchQuote() async {
    String query = 'SELECT * FROM $tableQuotes';

    List allData = await database.rawQuery(query);

    List<QuoteModal> allQuotes =
        allData.map((e) => QuoteModal.fromMap(data: e)).toList();

    return allQuotes;
  }

  Future<int> deleteQuote({required int id}) async {
    String query = 'DELETE FROM $tableQuotes WHERE Id = $id';

    return await database.rawDelete(query);
  }
}
