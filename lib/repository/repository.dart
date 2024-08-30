import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/api_data.dart';
import 'package:newsapp/data_models/news_data_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository extends ChangeNotifier {
  static ValueNotifier<List<NewsDataModel>> favNewsNotifier = ValueNotifier([]);
  static ValueNotifier<List<NewsDataModel>> news = ValueNotifier([]);
 static bool loading = true;
 static bool error = false;


  static void notifyListeners1() {
    favNewsNotifier.notifyListeners();
  }

  Future<List<NewsDataModel>> fetchAllNews() async {
    try {
      loading=true;
      error=false;
       news.notifyListeners();
       news.value.clear();
      var responce = await http.get(Uri.parse(ApiCredential.url));
      if (responce.statusCode == 200) {
        List data = jsonDecode(responce.body)['articles'];
        for (var element in data) {
          news.value.add(NewsDataModel.fromJson(element));
        }
      }
      return news.value;
    } catch (e) {
      error = true;
      news.notifyListeners();
      rethrow;
    } finally {
      loading = false;
      news.notifyListeners();
    }
  }
}
