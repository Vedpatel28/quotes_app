import 'package:get/get.dart';
import 'package:quotes_app/helper/api_helper_class.dart';
import 'package:quotes_app/modals/api_modal.dart';

class ApiController extends GetxController {
  RxList allData = [].obs;
  RxString category = "funny".obs;

  List<ApiModal>? allQuotes;

  searchCategory({required String category}) {
    this.category(category);
  }

  Future<void> getData() async {
    allQuotes = await ApiHelper.apiHelper.getApi();
    allData(allQuotes);
  }
}
