import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quotes_app/modals/api_modal.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();

  List<ApiModal> quotes = [];
  final String api = "https://api.api-ninjas.com/v1/quotes?limit=15";

  Future<List<ApiModal>?> getApi() async {
    http.Response response = await http.get(Uri.parse(api),
        headers: {'x-Api-Key': 'DjwHGf1zjhpHli2jwHHMuA==Z5kZFPiDVsrURbCx'});

    if (response.statusCode == 200) {
      List tmpquote = jsonDecode(response.body);
      quotes = tmpquote.map((e) => ApiModal.fromApi(data: e)).toList();
      return quotes;
    }
    return null;
  }
}