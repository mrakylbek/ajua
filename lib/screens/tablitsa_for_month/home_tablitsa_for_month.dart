// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/data.dart';
import '../../constants/textStyles.dart';

class TablitsaMonth extends StatefulWidget {
  const TablitsaMonth({super.key});

  @override
  State<TablitsaMonth> createState() => _TablitsaMonthState();
}

class _TablitsaMonthState extends State<TablitsaMonth> {
  final dayNow = DateTime.now().day;
  // print(dayNow);
  final monthNow = DateTime.now().month;
  int monthOnScreen = 0;
  // print(monthNow);
  final yearNow = DateTime.now().year;
  // print(yearNow);
  // final daysInMonth = DateTimeRange(
  //   start: DateTime(yearNow, monthNow, 1),
  //   end: DateTime(yearNow, monthNow + 1, 1),
  // );
  String nameMonthOnscreen = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    monthOnScreen = monthNow - 1;
    nameMonthOnscreen = months[monthOnScreen];
  }

  @override
  Widget build(BuildContext context) {
    final difDays = DateTime(yearNow, monthNow, dayNow)
        .toUtc()
        .difference(DateTime(yearNow, monthNow, 1))
        .inDays;
    // print(difDays);
    final daysInMonth = DateTime(yearNow, monthNow + 1, 1)
        .toUtc()
        .difference(DateTime(yearNow, monthNow, 1))
        .inDays;
    // print(daysInMonth);
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
                nameTimesList(),
                SizedBox(height: 5),
                Column(
                  children: List.generate(
                    daysInMonth,
                    (index) => timerPerDay(index, difDays),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container timerPerDay(int index, int difDays) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: index < difDays ? greyef : white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 24,
            child: Center(
              child: Text(
                '${index + 1}',
                style: index < difDays ? ts55_12_400_0 : ts33_12_600_0,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '06:07',
                style: index < difDays ? ts55_12_400_0 : ts33_12_600_0,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '07:24',
                style: index < difDays ? ts55_12_400_0 : ts33_12_600_0,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '12:39',
                style: index < difDays ? ts55_12_400_0 : ts33_12_600_0,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '15:23',
                style: index < difDays ? ts55_12_400_0 : ts33_12_600_0,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '17:48',
                style: index < difDays ? ts55_12_400_0 : ts33_12_600_0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container nameTimesList() {
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
          Container(
            width: 24,
            child: Center(
              child: Text(
                '•',
                style: tswh_16_600_0,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Фан',
                style: tsf4_12_700_0,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Зухр',
                style: tsf4_12_700_0,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Аср',
                style: tsf4_12_700_0,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Маг',
                style: tsf4_12_700_0,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Иша',
                style: tsf4_12_700_0,
              ),
            ),
          ),
        ],
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
                print('Nazad');
                // print(monthOnScreen);
                setState(() {
                  monthOnScreen = monthOnScreen - 1;
                  nameMonthOnscreen = months[monthOnScreen];
                });
                // print(monthOnScreen);
              }
            },
            child: Container(
              child: Icon(
                Icons.chevron_left,
                size: 24,
                color: monthOnScreen > 0 ? black11 : greyc1,
              ),
            ),
          ),
          Text(
            // '${months[monthOnScreen - 1]}',
            nameMonthOnscreen,
            style: ts33_16_700_0,
          ),
          InkWell(
            onTap: () {
              if (monthOnScreen < 11) {
                print('Vpered');
                setState(() {
                  monthOnScreen = monthOnScreen + 1;
                  nameMonthOnscreen = months[monthOnScreen];
                });
              }
            },
            child: Container(
              child: Icon(
                Icons.chevron_right,
                size: 24,
                color: monthOnScreen < 11 ? black11 : greyc1,
              ),
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
