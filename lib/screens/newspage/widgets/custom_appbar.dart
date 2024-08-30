import 'package:flutter/material.dart';

PreferredSize customAppBar(BuildContext context) {
  return PreferredSize(
      preferredSize: Size(MediaQuery.sizeOf(context).width, 100),
      child: Container(
        margin:const EdgeInsets.only(left: 20),
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child:const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Icon(Icons.arrow_back_ios),
                 Text('Back',style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
          ),
      ));
}
