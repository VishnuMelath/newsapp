import 'package:flutter/material.dart';
import 'package:newsapp/style/colors.dart';
import 'package:newsapp/style/fontstyles.dart';

Widget dateWidget(String date)
{
  return Row(mainAxisSize: MainAxisSize.min,children: [ 
    Icon(Icons.calendar_month,color: grey,),
    Text(date,style: greyDateTextStyle,)
  ],);
}