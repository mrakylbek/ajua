// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/colors.dart';
import '../../constants/data.dart';
import '../../constants/textStyles.dart';
import 'bloc/calendar_bloc.dart';

class TablitsaMonth extends StatefulWidget {
  const TablitsaMonth({super.key});

  @override
  State<TablitsaMonth> createState() => _TablitsaMonthState();
}

int dayNow = DateTime.now().day;
// print(dayNow);
int monthNow = DateTime.now().month;
// print(monthNow);
int yearNow = DateTime.now().year;

// print(yearNow);
// final daysInMonth = DateTimeRange(
//   start: DateTime(yearNow, monthNow, 1),
//   end: DateTime(yearNow, monthNow + 1, 1),
// );

final difDays = DateTime(yearNow, monthNow, dayNow)
    .toUtc()
    .difference(DateTime(yearNow, monthNow, 1))
    .inDays;
// print(difDays);
int daysInMonth = getDaysInMonth(yearNow, monthNow);

// print(daysInMonth);
class _TablitsaMonthState extends State<TablitsaMonth> {
  int monthOnScreen = 5;
  String nameMonthOnscreen = '';
  List<String> sortedMonths = List.generate(12, (index) => '13');
  Map<int, Map<String, dynamic>> listPrayerTimes = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // monthOnScreen = monthNow - 1;
    sortedMonths = getSortedMonthsList(monthNow);
    nameMonthOnscreen = sortedMonths[6];
    context.read<CalendarBloc>().add(CalendarLoadEvent(
          month: months.indexOf(sortedMonths[monthOnScreen]) + 1,
          year: yearNow,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        if (state is CalendarLoaded) {
          // setState(() {
          listPrayerTimes = state.timesPerDayInMonth;
          // });
        }
        return Scaffold(
          appBar: appBar(),
          backgroundColor: whitef9,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    nameMonth(monthNow - 1),
                    SizedBox(height: 16),
                    namePrayerTimesList(),
                    SizedBox(height: 5),
                    if (state is CalendarLoaded)
                      Column(
                        children:
                            //
                            // listPrayerTimes.map(
                            //     (key, value) => timerPerDay(index, difDays))
                            List.generate(
                          daysInMonth,
                          (index) => timesPerDay(index, difDays,
                              state.timesPerDayInMonth[index + 1]!),
                        ),
                      )
                    else
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(color: blue),
                      ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container timesPerDay(
      int index, int difDays, Map<String, dynamic> timesList) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: monthOnScreen >= 5
            ? sortedMonths[monthOnScreen] == months[monthNow - 1] &&
                    index < difDays
                ? greyef
                : white
            : greyef,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 24,
            child: Center(
              child: Text(
                '${index + 1}',
                style: sortedMonths[monthOnScreen] == months[monthNow - 1] &&
                        index < difDays
                    ? ts55_12_400_0
                    : ts33_12_600_0,
              ),
            ),
          ),
          timeBody(index, difDays, timesList['fajr']),
          timeBody(index, difDays, timesList['dhuhr']),
          timeBody(index, difDays, timesList['asr']),
          timeBody(index, difDays, timesList['maghrib']),
          timeBody(index, difDays, timesList['isha']),
        ],
      ),
    );
  }

  Widget timeBody(int index, int difDays, String time) {
    return Expanded(
      child: Center(
        child: Text(
          time,
          style: sortedMonths[monthOnScreen] == months[monthNow - 1] &&
                  index < difDays
              ? ts55_12_400_0
              : ts33_12_600_0,
        ),
      ),
    );
  }

  Container namePrayerTimesList() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 24,
            child: Center(
              child: Text(
                '•',
                style: tswh_16_600_0,
              ),
            ),
          ),
          namePrayerTime('Фан'),
          namePrayerTime('Зухр'),
          namePrayerTime('Аср'),
          namePrayerTime('Маг'),
          namePrayerTime('Иша'),
        ],
      ),
    );
  }

  Expanded namePrayerTime(String name) {
    return Expanded(
      child: Center(
        child: Text(
          name,
          style: tsf4_12_700_0,
        ),
      ),
    );
  }

  Container nameMonth(int monthNow) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              if (monthOnScreen > 0) {
                // print('Nazad');
                // print(monthOnScreen);
                setState(() {
                  monthOnScreen = monthOnScreen - 1;
                  nameMonthOnscreen = sortedMonths[monthOnScreen];
                  daysInMonth = getDaysInMonth(
                      yearNow, months.indexOf(sortedMonths[monthOnScreen]) + 1);
                  yearNow = months.indexOf(sortedMonths[monthOnScreen + 1]) == 0
                      ? yearNow - 1
                      : yearNow;
                });
                // print(monthOnScreen);
                context.read<CalendarBloc>().add(CalendarLoadEvent(
                      month: months.indexOf(sortedMonths[monthOnScreen]) + 1,
                      year: yearNow,
                    ));
              }
            },
            child: Icon(
              Icons.chevron_left,
              size: 24,
              color: monthOnScreen > 0 ? black11 : greyc1,
            ),
          ),
          Text(
            sortedMonths[monthOnScreen],
            // nameMonthOnscreen,
            style: ts33_16_700_0,
          ),
          InkWell(
            onTap: () {
              if (monthOnScreen < 11) {
                // print('Vpered');
                setState(() {
                  monthOnScreen = monthOnScreen + 1;
                  nameMonthOnscreen = sortedMonths[monthOnScreen];
                  // daysInMonth = getDaysInMonth(
                  //   months.indexOf(sortedMonths[monthOnScreen]) == 11
                  //       ? yearNow
                  //       : yearNow + 1,
                  //   monthNow + 1,
                  // );
                  daysInMonth = getDaysInMonth(
                      yearNow, months.indexOf(sortedMonths[monthOnScreen]) + 1);
                  yearNow =
                      months.indexOf(sortedMonths[monthOnScreen - 1]) == 11
                          ? yearNow + 1
                          : yearNow;
                });
                // print(monthOnScreen);
                context.read<CalendarBloc>().add(CalendarLoadEvent(
                      month: months.indexOf(sortedMonths[monthOnScreen]) + 1,
                      year: yearNow,
                    ));
              }
            },
            child: Icon(
              Icons.chevron_right,
              size: 24,
              color: monthOnScreen < 11 ? black11 : greyc1,
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: white,
      leading: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.chevron_left,
          size: 24,
          color: black11,
        ),
      ),
      title: Text(
        'Таблица на месяц',
        style: ts11_16_600_06,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}

List<String> getSortedMonthsList(int month) {
  final List<String> sortedMonths = List.generate(12, (index) => '13');

  // print(month);
  for (var i = 0; i < 7; i++) {
    // print(i);
    sortedMonths[5 + i] =
        (month + i <= 12) ? months[month - 1 + i] : months[month - 1 + i - 12];
    // sortedMonths[5 + i] = (month + i < 12) ? month + i : month + i - 12;
  }
  // print(sortedMonths);
  for (var i = 0; i <= 5; i++) {
    // print(i);
    sortedMonths[5 - i] =
        (month - i > 0) ? months[month - 1 - i] : months[month - 1 - i + 12];
    // sortedMonths[4 - i] = (month - i > 0) ? month - i - 1 : month - i + 12;
  }
  // print(sortedMonths);
  return sortedMonths;
}

int getDaysInMonth(int yearNowF, int monthNowF) {
  // print(monthNowF);
  return DateTime(yearNowF, monthNowF + 1, 1)
      .toUtc()
      .difference(DateTime(yearNowF, monthNowF, 1))
      .inDays;
}
