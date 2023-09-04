import 'package:get/get.dart';
import 'package:quotes_app/helper/db_helper_class.dart';
import 'package:quotes_app/modals/quotes_modals.dart';

class QuotesController extends GetxController {
  RxList<QuotesModals> allHistoryQuotes = <QuotesModals>[].obs;

  get getAllHistoryQuotes async {
    return allHistoryQuotes(await DBHelper.dbHelper.displayQuotes());
  }
}
