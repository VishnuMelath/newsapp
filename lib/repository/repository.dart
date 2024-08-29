import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/api_data.dart';
import 'package:newsapp/data_models/news_data_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  static ValueNotifier<List<NewsDataModel>> favNewsNotifier = ValueNotifier([]);
  Future<List<NewsDataModel>> fetchAllNews() async {
    List<NewsDataModel> news = [];
    try {
      var responce = await http.get(Uri.parse(ApiCredential.url));
      if (responce.statusCode == 200) {
        List data = jsonDecode(responce.body)['articles'];
        for (var element in data) {
          news.add(NewsDataModel.fromJson(element));
        }
      }
      return news;
    } catch (e) {
      rethrow;
    }
  }
}
