import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:newsapp/data_models/news_data_model.dart';
import 'package:newsapp/screens/homepage/widgets/custom_slidable.dart';
import 'package:newsapp/screens/homepage/widgets/datewidget.dart';
import 'package:newsapp/repository/repository.dart';

import 'package:newsapp/style/fontstyles.dart';

Widget newsTile(NewsDataModel newsmodel) {
  ValueNotifier<bool> favOrNot =
      ValueNotifier(NewsRepository.favNewsNotifier.value.contains(newsmodel));
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Slidable(
      closeOnScroll: false,
      endActionPane: ActionPane(
          openThreshold: 0.1,
          extentRatio: 0.2,
          motion: const ScrollMotion(),
          children: [
            ValueListenableBuilder(
                valueListenable: favOrNot,
                builder: (context, value, _) {
                  return customSlidable(() {
                    if (value) {
                      NewsRepository.favNewsNotifier.value
                          .remove(newsmodel);
                      favOrNot.value = !favOrNot.value;
                    } else {
                      NewsRepository.favNewsNotifier.value.add(newsmodel);
                      favOrNot.value = !favOrNot.value;
                    }
                  }, value ? 'Remove\nfrom' : 'Add to');
                })
          ]),
      child: Material(
            color: Colors.white,
            borderRadius:BorderRadius.circular(10),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        newsmodel.image,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsmodel.title,
                          maxLines: 2,
                          style: blackBoldTextStyle,
                        ),
                        Text(
                          newsmodel.description,
                          maxLines: 2,
                          style: blackPlainTextStyle,
                        ),
                        dateWidget(newsmodel.publishedAt)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )));
        
}
