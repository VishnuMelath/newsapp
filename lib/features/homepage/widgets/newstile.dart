import 'package:flutter/material.dart';
import 'package:newsapp/data_models/news_data_model.dart';

Widget newsTile(NewsDataModel newsmodel) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.network(newsmodel.image)
          ,const SizedBox(width: 10,)
          ,Column( 
            children: [ 
              Text(newsmodel.title),
              Text(newsmodel.description),
              
            ],
          )
        ],
      ),
    ),
  );
}
