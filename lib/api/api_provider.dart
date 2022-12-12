import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  static final ApiProvider _singleton = ApiProvider._internal();

  factory ApiProvider() {
    return _singleton;
  }

  ApiProvider._internal();

  Map<int, Map<String, dynamic>> timesPerMonth = {};
  String baseUrl_1 = 'https://api.muftyat.kz/prayer-times/';
  String baseUrl_2 = '/43.238293/76.945465?format=json';

  Future<Map<int, Map<String, dynamic>>> getTimes(int month, int year) async {
    String url = baseUrl_1 + year.toString() + baseUrl_2;
    // print(url);
    // print(month);
    // print(year);
    final days = getDifDays(month);
    timesPerMonth = {};
    // final response = http.Response();
    try {
      final response = await http.get(Uri.parse(url));
      // print('Got response');
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
        timesPerMonth[j] = timesPerDay;
        j++;
      }
      // print('after cycle');
      // timesPerMonth.forEach(
      //   (k, v) => print('${k}: ${v}'),
      // );
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
    // print(daysTillMonth);
    final int daysTillNextMonth = DateTime(yearNow, month + 1)
        .toUtc()
        .difference(DateTime(yearNow, 1, 1))
        .inDays;
    // print(daysTillNextMonth);
    return [daysTillMonth, daysTillNextMonth];
  }
}
