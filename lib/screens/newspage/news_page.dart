import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newsapp/data_models/news_data_model.dart';
import 'package:newsapp/screens/homepage/widgets/datewidget.dart';
import 'package:newsapp/screens/newspage/widgets/custom_appbar.dart';
import 'package:newsapp/screens/newspage/widgets/image_widget.dart';
import 'package:newsapp/style/fontstyles.dart';

class NewsPage extends StatelessWidget {
  final NewsDataModel newsDataModel;
  const NewsPage({super.key,required this.newsDataModel});

  @override
  Widget build(BuildContext context) {
    log(newsDataModel.content.length.toString());
    return  Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar:customAppBar(context),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 20.0,left: 20,right: 20),
            child: ListView(
              children: [ 
                imageWidget(newsModel: newsDataModel)
                , Text(newsDataModel.title,style: blackLargeBoldTextStyle,),
                dateWidget(newsDataModel.publishedAt),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text(newsDataModel.content,style: contentTextStyle,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}