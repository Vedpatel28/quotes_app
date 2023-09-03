import 'package:get/get.dart';
import 'package:quotes_app/helper/db_helper_class.dart';
import 'package:quotes_app/modals/favorite_table_model.dart';

class FavoritesController extends GetxController {
  RxList<QuotesFavoriteModals> allFavoriteQuotes = <QuotesFavoriteModals>[].obs;

  get getAllFavoritesQuotes {
    return  allFavoriteQuotes(DBHelper.dbHelper.displayLikeQuotes() as List<QuotesFavoriteModals>?);
  }
}
