
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:newsapp/data_models/news_data_model.dart';
import 'package:newsapp/screens/homepage/widgets/custom_slidable.dart';
import 'package:newsapp/screens/homepage/widgets/custom_snackbar.dart';
import 'package:newsapp/screens/homepage/widgets/datewidget.dart';
import 'package:newsapp/repository/repository.dart';
import 'package:newsapp/screens/newspage/news_page.dart';

import 'package:newsapp/style/fontstyles.dart';

class Newstile extends StatefulWidget {
  final NewsDataModel newsDataModel;
  const Newstile({
    super.key,
    required this.newsDataModel,
  });

  @override
  State<Newstile> createState() => _NewstileState();
}

class _NewstileState extends State<Newstile> with TickerProviderStateMixin {
  late NewsDataModel newsmodel;
  late SlidableController controller;
  late ValueNotifier<bool> favOrNot;
  @override
  void initState() {
    newsmodel = widget.newsDataModel;
    controller = SlidableController(this);
    favOrNot =
        ValueNotifier(NewsRepository.favNewsNotifier.value.contains(newsmodel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Slidable(
            controller: controller,
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
                          newsmodel.favorite = !newsmodel.favorite;
                          if (value) {
                            NewsRepository.favNewsNotifier.value
                                .remove(newsmodel);
                            customSnackbar(context, 'Removed from favorite');

                            favOrNot.value = !favOrNot.value;

                            controller.close();
                          } else {
                            NewsRepository.favNewsNotifier.value.add(newsmodel);
                            favOrNot.value = !favOrNot.value;
                            customSnackbar(context, 'Added to favorite');

                            controller.close();
                          }
                          NewsRepository.notifyListeners1();
                        }, value ? 'Remove\nfrom' : 'Add to');
                      })
                ]),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsPage(newsDataModel: newsmodel),
                    ));
              },
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
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
              ),
            )));
  }
}
