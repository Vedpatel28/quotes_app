// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quotes_app/controller/api_controller.dart';
import 'package:quotes_app/modals/api_modal.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  List<ApiModal> allQuotes = [];
  static ApiController apiController = Get.find();

  final String api =
      "https://api.api-ninjas.com/v1/quotes?limit=10&category=${apiController.category.value}";

  Future<List<ApiModal>?> getApi() async {
    http.Response res = await http.get(Uri.parse(api),
        headers: {'x-Api-Key': 'DjwHGf1zjhpHli2jwHHMuA==Z5kZFPiDVsrURbCx'});


      log("Response : ${res.statusCode}");

    if (res.statusCode == 200) {
      log("$res");
      List quotes = jsonDecode(res.body);
      allQuotes = quotes.map((e) => ApiModal.fromApi(data: e)).toList();
      return allQuotes;
    }
  }
}
