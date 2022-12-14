import 'dart:convert';

import 'package:ajua_namaz_1/models/today_pray_times_model.dart';
import 'package:http/http.dart' as http;

final now = DateTime.now().toUtc().toLocal();

class ApiProvider {
  static final ApiProvider _singleton = ApiProvider._internal();

  factory ApiProvider() {
    return _singleton;
  }

  ApiProvider._internal();

  Map<int, Map<String, dynamic>> timesPerMonth = {};
  String baseUrl_1 = 'https://api.muftyat.kz/prayer-times/';
  String baseUrl_2 = '/43.238293/76.945465?format=json';

  Future<Map<int, Map<String, dynamic>>> getTimesForTablitsa(
      int month, int year) async {
    String url = baseUrl_1 + year.toString() + baseUrl_2;
    // print(url);
    // print(month);
    // print(year);
    final days = getDifDaysForTablitsa(month);
    // timesPerMonth = {};
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

  List<int> getDifDaysForTablitsa(int month) {
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

  Future<TodayPrayTimesModel> getTimesForToday() async {
    TodayPrayTimesModel tr = TodayPrayTimesModel(
        timesPerDay: {}, nextIndex: 6, drToNextTime: Duration(hours: 24));
    int month = DateTime.now().month;
    int year = DateTime.now().year;
    int today = DateTime.now().day;
    String url = baseUrl_1 + year.toString() + baseUrl_2;
    // print(url);
    // print(month);
    // print(year);
    final days = getDifDaysDay(month, today);

    timesPerMonth = {};
    // final response = http.Response();
    try {
      final response = await http.get(Uri.parse(url));
      print('Got tesponse');
      List<dynamic> times =
          jsonDecode(utf8.decode(response.bodyBytes))['result'];

      String date = times[days]['Date'];
      String fajr = times[days]['fajr'];
      String dhuhr = times[days]['dhuhr'];
      String asr = times[days]['asr'];
      String maghrib = times[days]['maghrib'];
      String isha = times[days]['isha'];
      Map<String, dynamic> timesPerDay = {
        // 'date': date,
        '0': fajr,
        '1': dhuhr,
        '2': asr,
        '3': maghrib,
        '4': isha,
      };
      print('after cycle');
      print(timesPerDay);
      List index = await getNextPrayTime(timesPerDay, year, month, today);
      print(index[0]);
      tr = TodayPrayTimesModel(
          timesPerDay: timesPerDay,
          nextIndex: index[0],
          drToNextTime: index[1],
          fajrTime: index.length != 2 ? index[2] : '1');
      return tr;
      // String stFajr = timesPerDay['fajr'];
      // String stFajr = timesPerDay['fajr'];

      // print(timesPerMonth);
      // print(times);
      // var t = jsonDecode(utf8.decode(response.bodyBytes))['result'][0]['asr'];
      // print(t.runtimeType);
    } catch (e) {
      print(e);
    }
    return tr;
  }

  Future<List<dynamic>> getTimesForTomorrow() async {
    TodayPrayTimesModel tr = TodayPrayTimesModel(
        timesPerDay: {}, nextIndex: 6, drToNextTime: Duration(hours: 24));
    int month = DateTime.now().month;
    int year = DateTime.now().year;
    int today = DateTime.now().day;
    // print(url);
    // print(month);
    // print(year);
    int days = getDifDaysDay(month, today);
    if (year % 4 != 0 && days != 365) {
      // esli etot den 31 dekabrya
      days = days + 1;
    } else {
      days = 1;
      year = year + 1;
      today = 1;
    }
    String url = baseUrl_1 + year.toString() + baseUrl_2;
    List<DateTime> dts = [];
    List<dynamic> dynlist = [];
    Map<String, dynamic> timesPerDay = {};
    // final response = http.Response();
    try {
      final response = await http.get(Uri.parse(url));
      print('Got response');
      List<dynamic> times =
          jsonDecode(utf8.decode(response.bodyBytes))['result'];

      String date = times[days]['Date'];
      String fajr = times[days]['fajr'];
      String dhuhr = times[days]['dhuhr'];
      String asr = times[days]['asr'];
      String maghrib = times[days]['maghrib'];
      String isha = times[days]['isha'];
      timesPerDay = {
        // 'date': date,
        '0': fajr,
        '1': dhuhr,
        '2': asr,
        '3': maghrib,
        '4': isha,
      };
      print('after cycle');
      print(timesPerDay);
      // List index = getNextPrayTime(timesPerDay, year, month, today);
      // print(index[0]);
      // tr = TodayPrayTimesModel(
      //     timesPerDay: timesPerDay,
      //     nextIndex: index[0],
      //     drToNextTime: index[1]);
      dts = getListTimes(timesPerDay, year, month, today + 1);
      dynlist = [dts, fajr];
      return dynlist;
      // String stFajr = timesPerDay['fajr'];
      // String stFajr = timesPerDay['fajr'];

      // print(timesPerMonth);
      // print(times);
      // var t = jsonDecode(utf8.decode(response.bodyBytes))['result'][0]['asr'];
      // print(t.runtimeType);
    } catch (e) {
      print(e);
    }
    return dynlist;
  }

  Future<List<dynamic>> getNextPrayTime(Map<String, dynamic> prayTimes,
      int yearNow, int monthNow, int today) async {
    print('NOW  ' + now.toString());
    int index = 6;

    Duration dr = Duration(hours: 24);
    print(dr);
    print('after compare');
    List<DateTime> dateTimes =
        getListTimes(prayTimes, yearNow, monthNow, today);
    for (var i = 0; i < 5; i++) {
      print(i);
      if (now.compareTo(dateTimes[i]) <= 0) {
        print('NEXT TIME');
        dr = now.difference(dateTimes[i]);
        print(dr);
        dr = now.difference(dateTimes[i]).abs();
        print(dateTimes[i]);
        return [i, dr];
      }
      if (i == 4 && index == 6) {
        print('STARTED TIME FOR TOMORROW MORNING TIME');

        List<dynamic> dynTomorrow = await getTimesForTomorrow();
        List<DateTime> dtTomorrow = dynTomorrow[0];
        print('Duration till tomorrow morning pray');
        dr = now.difference(dtTomorrow[0]).abs();
        print(dr);
        print(dtTomorrow[0]);
        return [0, dr, dynTomorrow[1]];
      }
      print('NOT AFTER');
      dr = now.difference(dateTimes[i]);
      print(dr);
      print(dateTimes[i]);
    }
    return [index, dr];
  }

  List<DateTime> getListTimes(
      Map<String, dynamic> prayTimes, int yearNow, int monthNow, int today) {
    // String date = prayTimes['Date'];
    String fajr = prayTimes['0'];
    String dhuhr = prayTimes['1'];
    String asr = prayTimes['2'];
    String maghrib = prayTimes['3'];
    String isha = prayTimes['4'];
    // String fajr = prayTimes['fajr'];
    // String dhuhr = prayTimes['dhuhr'];
    // String asr = prayTimes['asr'];
    // String maghrib = prayTimes['maghrib'];
    // String isha = prayTimes['isha'];
    // Duration drFajr = Duration(
    //     hours: int.parse(fajr.substring(0, 2)),
    //     minutes: int.parse(fajr.substring(3)));
    // Duration drDuhr = Duration(
    //     hours: int.parse(dhuhr.substring(0, 2)),
    //     minutes: int.parse(dhuhr.substring(3)));
    // Duration drAsr = Duration(
    //     hours: int.parse(asr.substring(0, 2)),
    //     minutes: int.parse(asr.substring(3)));
    // Duration drMagrib = Duration(
    //     hours: int.parse(maghrib.substring(0, 2)),
    //     minutes: int.parse(maghrib.substring(3)));
    // Duration drIsha = Duration(
    //     hours: int.parse(isha.substring(0, 2)),
    //     minutes: int.parse(isha.substring(3)));
    DateTime dtFajr = DateTime(
      yearNow,
      monthNow,
      today,
      int.parse(fajr.substring(0, 2)),
      int.parse(fajr.substring(3)),
    );
    DateTime dtDuhr = DateTime(
      yearNow,
      monthNow,
      today,
      int.parse(dhuhr.substring(0, 2)),
      int.parse(dhuhr.substring(3)),
    );
    DateTime dtAsr = DateTime(
      yearNow,
      monthNow,
      today,
      int.parse(asr.substring(0, 2)),
      int.parse(asr.substring(3)),
    );
    DateTime dtMagrib = DateTime(
      yearNow,
      monthNow,
      today,
      int.parse(maghrib.substring(0, 2)),
      int.parse(maghrib.substring(3)),
    );
    DateTime dtIsha = DateTime(
      yearNow,
      monthNow,
      today,
      int.parse(isha.substring(0, 2)),
      int.parse(isha.substring(3)),
    );
    print(int.parse(fajr.substring(0, 2)));
    print(int.parse(fajr.substring(3)));
    // print(drFajr);
    // print(drDuhr);
    // print(drDuhr > drFajr);
    print(dtFajr);
    print(dtDuhr);
    print(now.compareTo(dtIsha));

    List<DateTime> dateTimes = [dtFajr, dtDuhr, dtAsr, dtMagrib, dtIsha];
    return dateTimes;
  }

  int getDifDaysDay(int month, int day) {
    final yearNow = DateTime.now().year;

    final int daysTillToday = DateTime(yearNow, month, day)
        .toUtc()
        .difference(DateTime(yearNow, 1, 1))
        .inDays;
    print(daysTillToday);

    return daysTillToday;
  }
}
