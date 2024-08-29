import 'package:flutter/material.dart';
import 'package:newsapp/repository/repository.dart';

import 'newstile.dart';

Widget favNewsListWidget() {
  return ValueListenableBuilder(
    valueListenable: NewsRepository.favNewsNotifier,
    builder: (context, value, child) {
      if (value.isEmpty) {
        return const Center(
          child: Text('No news on favorite list'),
        );
      } else {
        return ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            return newsTile(value[index]);
          },
        );
      }
    },
  );
}
