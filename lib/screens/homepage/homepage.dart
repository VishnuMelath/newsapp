import 'package:flutter/material.dart';
import 'package:newsapp/screens/homepage/widgets/fav_news_list.dart';
import 'package:newsapp/screens/homepage/widgets/loading.dart';
import 'package:newsapp/screens/homepage/widgets/news_list.dart';
import 'package:newsapp/screens/homepage/widgets/optionbar.dart';
import 'package:newsapp/repository/repository.dart';

import 'widgets/newstile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ValueNotifier<String> selected = ValueNotifier('News');
  @override
  void initState() {
    NewsRepository().fetchAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  optionBar(context, 'News', selected),
                  optionBar(context, 'Favs', selected)
                ],
              ),
              ValueListenableBuilder(
                  valueListenable: selected,
                  builder: (context, seleceted, _) {
                    return Expanded(
                      child: seleceted == 'News'
                          ? newsListWidget()
                          : favNewsListWidget(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
