import 'package:flutter/material.dart';

Widget optionBar(
    BuildContext context, String title, ValueNotifier<String> selected) {
  return Padding(
    padding: const EdgeInsets.only(top:8.0),
    child: ValueListenableBuilder(
      valueListenable: selected,
      builder: (context, value, child) => GestureDetector(
        onTap: () {
          selected.value = title;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.sizeOf(context).width * 0.45,
          decoration: BoxDecoration(
              color: value == title ? const Color.fromARGB(255, 222, 236, 243) : Colors.white,
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon[title]!,
                const SizedBox(
                  width: 6,
                ),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Map<String, Icon> icon = {
  'News': const Icon(Icons.list),
  'Favs': const Icon(
    Icons.favorite,
    color: Color.fromARGB(255, 214, 96, 87),
  )
};
