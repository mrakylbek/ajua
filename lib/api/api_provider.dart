import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static final ApiProvider _singleton = ApiProvider._internal();

  factory ApiProvider() {
    return _singleton;
  }

  ApiProvider._internal();

  Map<String, Map<String, dynamic>> timesPerMonth = {};
  String baseUrl =
      'https://api.muftyat.kz/prayer-times/2022/43.238293/76.945465?format=json';

  Future<Map<String, Map<String, dynamic>>> getTimes(int month) async {
    final days = getDifDays(month);

    // final response = http.Response();
    try {
      final response = await http.get(Uri.parse(baseUrl));
      print('Got tesponse');
      // print(jsonDecode(utf8.decode(response.bodyBytes)));
      // Map<String, dynamic> times =
      //     jsonDecode(utf8.decode(response.bodyBytes))['result'][indexOfToday];
      List<dynamic> times =
          jsonDecode(utf8.decode(response.bodyBytes))['result'];
      int j = 1;
      for (int i = days[0]; i < days[1]; i++) {
        // print(j);
        String fajr = times[i]['fajr'];
        String dhuhr = times[i]['dhuhr'];
        String asr = times[i]['asr'];
        String maghrib = times[i]['maghrib'];
        String isha = times[i]['isha'];
        Map<String, dynamic> timesPerDay = {
          'fajr': fajr,
          'dhuhr': dhuhr,
          'asr': asr,
          'maghrib': maghrib,
          'isha': isha,
        };
        timesPerMonth[j.toString()] = timesPerDay;
        j++;
      }
      print('after cycle');
      timesPerMonth.forEach(
        (k, v) => print('${k}: ${v}'),
      );
      // print(timesPerMonth);
      // print(times);
      // var t = jsonDecode(utf8.decode(response.bodyBytes))['result'][0]['asr'];
      // print(t.runtimeType);
    } catch (e) {
      print(e);
    }
    return timesPerMonth;
  }

  List<int> getDifDays(int month) {
    // final today = DateTime.now().day;
    // final monthNow = DateTime.now().month;
    // print(monthNow);
    final yearNow = DateTime.now().year;
    // print(yearNow);
    // final daysInMonth = DateTimeRange(
    //   start: DateTime(yearNow, monthNow, 1),
    //   end: DateTime(yearNow, monthNow + 1, 1),
    // );
    // final int daysInMonth = DateTime(yearNow, month + 1)
    //     .toUtc()
    //     .difference(DateTime(yearNow, month))
    //     .inDays;
    // print(daysInMonth);
    final int daysTillMonth = DateTime(yearNow, month, 1)
        .toUtc()
        .difference(DateTime(yearNow, 1, 1))
        .inDays;
    print(daysTillMonth);
    final int daysTillNextMonth = DateTime(yearNow, month + 1)
        .toUtc()
        .difference(DateTime(yearNow, 1, 1))
        .inDays;
    print(daysTillNextMonth);
    return [daysTillMonth, daysTillNextMonth];
  }
}
