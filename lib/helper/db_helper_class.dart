// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:path/path.dart';
import 'package:quotes_app/modals/favorite_table_model.dart';
import 'package:quotes_app/modals/quotes_modals.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  late Database database;

  String quotesTable = "QuotesTable";
  String quotesLikeTable = "QuotesLikeTable";

  String qtId = "Id";
  String qtQuotes = "Quotes";
  String qtCategory = "Category";
  String qtAuthor = "Author";

  String qtLId = "FaId";
  String qtLQuotes = "FaQuotes";
  String qtLCategory = "FaCategory";
  String qtLAuthor = "FaAuthor";

  initDB() async {
    String dbPath = await getDatabasesPath();
    String dbName = "QT2.db";

    String finalPath = join(dbPath, dbName);

    database = await openDatabase(
      finalPath,
      version: 1,
      onCreate: (db, version) {
        db
            .execute(
                'CREATE TABLE $quotesTable ( $qtId INTEGER PRIMARY KEY AUTOINCREMENT , $qtQuotes TEXT , $qtCategory TEXT , $qtAuthor TEXT ) ')
            .then(
              (value) => log("Quotes Table are Created : DONE "),
            );

        db
            .execute(
                'CREATE TABLE $quotesLikeTable ( $qtLId INTEGER PRIMARY KEY AUTOINCREMENT , $qtLQuotes TEXT , $qtLCategory TEXT , $qtLAuthor TEXT ) ')
            .then(
              (value) => log("Favorite Table are Created : DONE "),
            );
      },
    );
  }

  insertQuotes(
      {required String quotes,
      required String category,
      required String author}) async {
    String query =
        " INSERT INTO $quotesTable($qtQuotes,$qtCategory,$qtAuthor) VALUES( ? , ? , ? ) ";

    List args = [quotes, category, author];

    int Quotes = await database.rawInsert(query, args);

    return Quotes;
  }

  insertLikeQuotes(
      {required String quotes,
      required String category,
      required String author}) async {
    String query =
        " INSERT INTO $quotesLikeTable($qtLQuotes,$qtLCategory,$qtLAuthor) VALUES( ? , ? , ? ) ";

    List args = [quotes, category, author];

    database.rawInsert(query, args);
  }

  displayQuotes() async {
    String query = "SELECT * FROM $quotesTable ";

    List quotes = await database.rawQuery(query);

    List<QuotesModals> allQuotes =
        quotes.map((e) => QuotesModals.fromMap(data: e)).toList();

    return allQuotes;
  }

  Future<List<QuotesFavoriteModals>> displayLikeQuotes() async {
    String query = "SELECT * FROM $quotesLikeTable ";

    List quotes = await database.rawQuery(query);

    List<QuotesFavoriteModals> allQuotes =
        quotes.map((e) => QuotesFavoriteModals.fromMap(data: e)).toList();

    return allQuotes;
  }

  Future<List<QuotesModals>> SearchTransaction(
      {required String remarks}) async {
    String query =
        'SELECT * FROM $quotesTable WHERE $qtCategory LIKE "%$remarks%"';

    List search = await database.rawQuery(query);

    log("$search");

    List<QuotesModals> allSearch =
        search.map((e) => QuotesModals.fromMap(data: e)).toList();

    return allSearch;
  }
}
