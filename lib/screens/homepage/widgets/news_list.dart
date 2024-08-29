import 'package:flutter/material.dart';

import '../../../repository/repository.dart';
import 'loading.dart';
import 'newstile.dart';

Widget newsListWidget()
{
  return  FutureBuilder(
                        future: NewsRepository().fetchAllNews(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isNotEmpty) {
                              return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return newsTile(snapshot.data![index]);
                                },
                              );
                            }
                            else {
                              return const Text('No news found tap to retry');
                            }
                          } else {
                           return loadingWidget();
                          }
                        },
                      );
}