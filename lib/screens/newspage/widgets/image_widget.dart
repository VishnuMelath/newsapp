import 'package:flutter/material.dart';
import 'package:newsapp/data_models/news_data_model.dart';
import 'package:newsapp/repository/repository.dart';

Widget imageWidget({required NewsDataModel newsModel}) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(top:  20,bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(newsModel.image),
        ),
      ),
      Positioned(
        top: 20,
        right: 0,
        child: ValueListenableBuilder(
          valueListenable: NewsRepository.favNewsNotifier,
          builder: (context, value, child) {
            bool fav = value.contains(newsModel);
            return IconButton(
                onPressed: () {
                  fav
                      ? NewsRepository.favNewsNotifier.value.remove(newsModel)
                      : NewsRepository.favNewsNotifier.value.add(newsModel);
                  NewsRepository.notifyListeners1();
                },
                icon: Icon(
                  fav ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red[200],
                ));
          },
        ),
      )
    ],
  );
}
