import 'package:flutter/material.dart';
import 'package:newsapp/style/colors.dart';
import 'package:newsapp/style/fontstyles.dart';

Widget dateWidget(String date) {

  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.calendar_month,
        color: grey,
        size: 15,
      ),
      Text(
        dateTimeString(date),
        style: greyDateTextStyle,
      )
    ],
  );
}


String dateTimeString(String date)
{
    var dateTimeList = date.split('T');
  var dateList = dateTimeList[0].split('-');
  var timeList = dateTimeList[1].split('Z')[0].split(':');

  var date1 = DateTime(
    int.parse(dateList[0]),
    int.parse(dateList[1]),
    int.parse(dateList[2]),
    int.parse(timeList[0]),
    int.parse(timeList[1]),
    int.parse(timeList[2]),

  );
  var day=getDayOfWeek(date1);
  var month=getMonthName(date1);
  return '$day,${date1.day} $month ${date1.year} ${date1.hour}:${date1.minute} GMT';
}

String getDayOfWeek(DateTime date) {
  switch (date.weekday) {
    case DateTime.monday:
      return 'Mon';
    case DateTime.tuesday:
      return 'Tue';
    case DateTime.wednesday:
      return 'Wed';
    case DateTime.thursday:
      return 'Thu';
    case DateTime.friday:
      return 'Fri';
    case DateTime.saturday:
      return 'Sat';
    case DateTime.sunday:
      return 'Sun';
    default:
      return 'Unknown';
  }
}

String getMonthName(DateTime date) {
  switch (date.month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'Aug';
    case 9:
      return 'Sept';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      return 'Unknown';
  }
}