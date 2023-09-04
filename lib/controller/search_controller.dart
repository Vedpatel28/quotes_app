import 'package:get/get.dart';
import 'package:quotes_app/helper/db_helper_class.dart';

class MySearchController extends GetxController {
  RxList search = [].obs;

  isSearch({required String quotes}) async {
    return search(
      await DBHelper.dbHelper.SearchTransaction(
        quotes: quotes,
      ),
    );
  }
}
