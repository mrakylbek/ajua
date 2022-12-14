// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:ajua_namaz_1/constants/data.dart';
import 'package:ajua_namaz_1/models/today_pray_times_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

bool turn = true;
int today = DateTime.now().day;
int month = DateTime.now().month;

class FirstColumn extends StatefulWidget {
  FirstColumn({
    super.key,
    required this.isLoaded,
    required this.maxW,
    this.tr,
    this.callBloc,
  });
  final bool isLoaded;
  final double maxW;
  final TodayPrayTimesModel? tr;
  final Function? callBloc;

  @override
  State<FirstColumn> createState() => _FirstColumnState();
}

class _FirstColumnState extends State<FirstColumn> {
  Timer? _timer;
  int _start = 10;
  String nameNextPray = '';
  int index = 6;
  String timeNextPray = '';
  int drseconds = 0;
  int minutes = 0;
  Duration dr = Duration(minutes: 0);
  bool isMinutesZero = false;
  String drInTimeBody = '00:00';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool isL = widget.isLoaded;
    // if (isL) {
    print('FIRST COLUMN ISLOADED ' + widget.isLoaded.toString());
    nameNextPray = vremya[widget.tr!.nextIndex];
    index = widget.tr!.nextIndex;
    timeNextPray = widget.tr!.fajrTime!.length != 1
        ? widget.tr!.fajrTime
        : widget.tr!.timesPerDay['${index}'];
    drseconds = widget.tr!.drToNextTime.inSeconds;
    minutes = widget.tr!.drToNextTime.inMinutes;
    dr = Duration(minutes: drseconds % 60 == 0 ? minutes : minutes + 1);
    drInTimeBody = dr.inHours < 10 ? '0' : '';
    drInTimeBody = drInTimeBody + dr.toString().substring(0, 4);
    startTimer();
    // }
  }

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = Timer(Duration(seconds: 0), () {});
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        drseconds = drseconds - 1;

        if (drseconds % 60 == 0) {
          print('object');
          setState(() {
            minutes = isMinutesZero ? minutes - 1 : minutes;
            dr = Duration(minutes: minutes);
            // drInTimeBody = Duration(minutes: minutes).toString().substring(0, 4);
            drInTimeBody = dr.inHours < 10 ? '0' : '';
            drInTimeBody = drInTimeBody + dr.toString().substring(0, 4);
            isMinutesZero = true;
          });
          // print(minutes);
          print(Duration(seconds: drseconds));
          // print(
          //     Duration(milliseconds: widget.tr!.drToNextTime.inMilliseconds - 1));
        }
        // if (drseconds % 60 == 0) {
        //   setState(() {});
        // }
        if (drseconds == 2) {
          widget.callBloc;
        }
      });
    }
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return firstColumn(widget.maxW);
  }

  Widget firstColumn(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: (maxWidth - 40 - 25) / 2,
          child: Image(
            image: AssetImage('assets/images/mosque_1.png'),
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 370.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              fajr(maxWidth),
              // SizedBox(height: 14),
              time(maxWidth),
            ],
          ),
        )
      ],
    );
  }

  Widget time(double maxWidth) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      height: 167.h,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 5),
          )
        ],
      ),
      width: (maxWidth - 40 - 12) / 2,
      child: widget.isLoaded
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 24.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.access_time,
                        color: blue,
                        size: 24.h,
                      ),
                      Switch(
                        value: turn,
                        onChanged: (val) {
                          print('turned to $val');
                          setState(() {
                            turn = !turn;
                          });
                        },
                        activeColor: Colors.white,
                        activeTrackColor: Colors.black,
                        inactiveTrackColor: Colors.black12,
                        inactiveThumbColor: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drInTimeBody,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Время до намаза ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffB9B9B9),
                      ),
                    ),
                    SizedBox(height: 4.h),
                  ],
                )
              ],
            )
          : Center(
              child: CircularProgressIndicator(color: blue),
            ),
    );
  }

  Widget fajr(double maxWidth) {
    return Container(
      height: 174.h,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 5),
          )
        ],
      ),
      width: (maxWidth - 40 - 12) / 2,
      child: widget.isLoaded
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  margin: EdgeInsets.only(bottom: 12.h),
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //   image: AssetImage('assets/images/mosque_icon.png'),
                  //   fit: BoxFit.contain,
                  // )),
                  child: Image(
                    image: AssetImage('assets/images/mosque_icon.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                // SizedBox(height: 12.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 'Фаджр',
                      nameNextPray,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        const Text(
                          'Начало ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffB9B9B9),
                          ),
                        ),
                        Text(
                          timeNextPray,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: blue,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          : Center(
              child: CircularProgressIndicator(color: blue),
            ),
    );
  }
}
