import 'package:flutter/material.dart';

import '../../../repository/repository.dart';
import 'loading.dart';
import 'newstile.dart';

Widget newsListWidget(BuildContext context,TickerProvider vsync) {
  return ValueListenableBuilder(
    valueListenable: NewsRepository.news,
    builder: (context, value, _) {
      if (!NewsRepository.loading) {
        if (NewsRepository.error) {
          return  Center(child: GestureDetector (
            onTap: () {
              
      NewsRepository().fetchAllNews();
            },
            child:ListView(
              children: [
                 SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.7,
                  child:const Center(child: Text('Error!!swipe down to refresh'))),
              ],
            )));
        } else {
          if (value.isNotEmpty) {
            return ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                return Newstile(newsDataModel: value[index]);
              },
            );
          } else {
            return const Center(child:  Text('No news found swipe down to refresh'));
          }
        }
      } else {
        return loadingWidget();
      }
    },
  );
}
