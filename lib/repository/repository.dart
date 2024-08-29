import 'package:flutter/material.dart';
import 'package:newsapp/data_models/news_data_model.dart';

class NewsRepository
{
  static ValueNotifier<List<NewsDataModel>> newsNotifier=ValueNotifier([]);
  Future<void> fetchAllNews()
  async{

  }
}