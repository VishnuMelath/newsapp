import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../style/colors.dart';
import '../../../style/fontstyles.dart';
import 'optionbar.dart';

Widget customSlidable(void Function()? onTap,String text)
{
  return  Slidable(
          closeOnScroll: false,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                        decoration: BoxDecoration(
                color: pink,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight:  Radius.circular(10))),
                        padding: const EdgeInsets.all(10),
                        child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon['Favs']!,
                  Text(
                    text,
                    style: blackBoldTextStyle,
                  ),
                   Text(
                    'Favorite',
                    style: blackBoldTextStyle,
                  )
                ],
              ),
                        ),
                      ),
            ));
}