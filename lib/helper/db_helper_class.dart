// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:path/path.dart';
import 'package:quotes_app/modals/quotes_modals.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  late Database database;

  String quotesTable = "QuotesTable";

  String qtId = "Id";
  String qtQuotes = "Quotes";
  String qtCategory = "Category";

  initDB() async {
    String dbPath = await getDatabasesPath();
    String dbName = "QT.db";

    String finalPath = join(dbPath, dbName);

    database = await openDatabase(
      finalPath,
      version: 1,
      onCreate: (db, version) {
        db
            .execute(
                'CREATE TABLE $quotesTable ( $qtId INTEGER PRIMARY KEY AUTOINCREMENT , $qtQuotes TEXT , $qtCategory TEXT ) ')
            .then(
              (value) => log("Transaction Table are Created : DONE "),
            );
      },
    );
  }

  insertQuotes({required String quotes, required String category}) async {
    String query =
        " INSERT INTO $quotesTable($qtQuotes,$qtCategory) VALUES( ? , ? ) ";

    List args = [quotes, category];

    int Quotes = await database.rawInsert(query, args);

    return Quotes;
  }

  displayQuotes() async {
    String query = "SELECT * FROM $quotesTable ";

    List quotes = await database.rawQuery(query);

    List<QuotesModals> allQuotes =
        quotes.map((e) => QuotesModals.fromMap(data: e)).toList();

    return allQuotes;
  }
}
