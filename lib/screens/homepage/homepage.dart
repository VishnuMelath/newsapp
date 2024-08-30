import 'package:flutter/material.dart';
import 'package:newsapp/screens/homepage/widgets/fav_news_list.dart';
import 'package:newsapp/screens/homepage/widgets/news_list.dart';
import 'package:newsapp/screens/homepage/widgets/optionbar.dart';
import 'package:newsapp/repository/repository.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin{
  ValueNotifier<String> selected = ValueNotifier('News');
late TickerProvider vsync;
  @override
  void initState() {
    vsync=this;
    NewsRepository().fetchAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: RefreshIndicator(
        onRefresh: () async{
      NewsRepository().fetchAllNews();
            },
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
                const SizedBox(height: 10,),
                ValueListenableBuilder(
                    valueListenable: selected,
                    builder: (context, seleceted, child) {
                      return Expanded(
                        child: seleceted == 'News'
                            ? newsListWidget(context,vsync)
                            : favNewsListWidget(context,vsync),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
