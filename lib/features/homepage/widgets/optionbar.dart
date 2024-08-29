import 'package:flutter/material.dart';

Widget optionBar(
    BuildContext context, String title, ValueNotifier<bool> selected) {
  return ValueListenableBuilder(
    valueListenable: selected,
    builder: (context, value, child) => Container(
      padding:const EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.sizeOf(context).width * 0.35,
      decoration: BoxDecoration(
          color: value ? Colors.blueGrey[100] : Colors.white,
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon[title]!,
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    ),
  );
}

Map<String, Icon> icon = {
  'News': const Icon(Icons.list),
  'Favs': const Icon(
    Icons.favorite,
    color: Colors.red,
  )
};
