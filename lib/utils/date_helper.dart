import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TimeOfDay dateToTime(DateTime dateTime) {
  return TimeOfDay.fromDateTime(dateTime);
}

String? dateToStringTime(BuildContext context, String? date) {
  if (date == null) return null;
  DateTime dateTime = DateTime.parse(date);
  TimeOfDay timeOfDay = TimeOfDay.fromDateTime(dateTime);
  return timeOfDay.format(context);
}

DateTime timeToDate(TimeOfDay timeOfDay) {
  DateTime dateTime = DateTime.now();

  return DateTime(
    dateTime.year,
    dateTime.month,
    dateTime.day,
    timeOfDay.hour,
    timeOfDay.minute,
  );
}

TimeOfDay addMinuteToTime(TimeOfDay timeOfDay, int minutes) {
  return TimeOfDay.fromDateTime(
    timeToDate(timeOfDay).add(
      Duration(minutes: minutes),
    ),
  );
}

/// Returns the Weekday string representation for the drop down text
String timeToWeekDay(DateTime dateTime, {DateTime? currentDate}) {
  String weekDay;
  DateTime now = DateTime.now();
  if (currentDate != null) {
    now = currentDate;
  }

  int lastday = DateTime(now.year, now.month + 1, 0).day;
  bool isNextDay = now.day == lastday &&
      now.add(Duration(days: 1)).month == dateTime.month &&
      dateTime.day == 1;

  if (checkMonthAndYear(now, dateTime) && dateTime.day == now.day) {
    weekDay = 'Today';
  } else if (checkMonthAndYear(now, dateTime) && dateTime.day == now.day + 1) {
    weekDay = 'Tomorrow';
  } else if (dateTime.isAfter(now) && isNextDay) {
    weekDay = 'Tomorrow';
  } else {
    weekDay = "${DateFormat.MMM().format(dateTime)} ${dateTime.day}";
  }

  return weekDay;
}

bool checkMonthAndYear(DateTime date1, DateTime date2) {
  return date1.month == date2.month && date1.year == date2.year;
}

bool checkYear(DateTime date1, DateTime date2) {
  return date1.year == date2.year;
}
