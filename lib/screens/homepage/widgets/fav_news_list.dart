import 'package:flutter/material.dart';
import 'package:newsapp/repository/repository.dart';

import 'newstile.dart';

Widget favNewsListWidget(BuildContext context,TickerProvider vsync) {
  return ValueListenableBuilder(
    valueListenable: NewsRepository.favNewsNotifier,
    builder: (context, value, child) {
      if (value.isEmpty) {
        return const Center(
          child: Text('No favorite news found'),
        );
      } else {
        return ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            return Newstile(newsDataModel: value[index]);
          },
        );
      }
    },
  );
}
