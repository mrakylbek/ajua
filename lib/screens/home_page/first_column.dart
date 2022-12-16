// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:ajua_namaz_1/constants/data.dart';
import 'package:ajua_namaz_1/models/today_pray_times_model.dart';
import 'package:ajua_namaz_1/screens/home_page/switch_bloc/switch_notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import 'bloc/get_pray_times_bloc.dart';

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
  bool sound = false;
  // void ifloaded() {
  //   index = widget.tr!.nextIndex == 6 ? 0 : widget.tr!.nextIndex;
  //   nameNextPray = vremya[index];
  //   index = widget.tr!.nextIndex;
  //   timeNextPray = widget.tr!.fajrTime!.length != 1
  //       ? widget.tr!.fajrTime
  //       : widget.tr!.timesPerDay['${index}'];
  //   drseconds = widget.tr!.drToNextTime.inSeconds;
  //   minutes = widget.tr!.drToNextTime.inMinutes;
  //   dr = Duration(minutes: drseconds % 60 == 0 ? minutes : minutes + 1);
  //   drInTimeBody = dr.inHours < 10 ? '0' : '';
  //   drInTimeBody = drInTimeBody + dr.toString().substring(0, 4);
  //   startTimer();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (isL) {
    print('FIRST COLUMN ISLOADED ' + widget.isLoaded.toString());
    // if (widget.isLoaded) ifloaded();
    // try {
    index = widget.tr!.nextIndex == 6 ? 0 : widget.tr!.nextIndex;
    nameNextPray = nazvaniePrayTime[index];
    index = widget.tr!.nextIndex;
    timeNextPray = widget.tr!.fajrTime!.length != 1
        ? widget.tr!.fajrTime
        : widget.tr!.timesPerDay['${index}'];
    drseconds = widget.tr!.drToNextTime.inSeconds;
    minutes = widget.tr!.drToNextTime.inMinutes;
    // print('DURATION IN HOURS ${widget.tr!.drToNextTime.inHours}');
    dr = Duration(minutes: drseconds % 60 == 0 ? minutes : minutes + 1);
    drInTimeBody = dr.inHours < 10 ? '0' : '';
    drInTimeBody += dr.toString().substring(0, dr.inHours < 10 ? 4 : 5);
    startTimer();
    // } catch (e) {
    //   print('ERROR IN FIRST COLUMN');
    //   print(e);
    // }
    // }
    context.read<SwitchNotificationBloc>().add(SwitchLoadEvent());
  }

  void switchOff(int index, BuildContext context) {
    context
        .read<SwitchNotificationBloc>()
        .add(SwitchOffEvent(indexOfPrayTime: index));
  }

  void switchOn(int index, BuildContext context) {
    context
        .read<SwitchNotificationBloc>()
        .add(SwitchOnEvent(indexOfPrayTime: index));
  }

  void callBloc() {
    context.read<GetPrayTimesBloc>().add(GetPrayTimesLoadEvent());
  }

  void startTimer() {
    if (widget.isLoaded) {
      print('TIMER STARTED');
      if (_timer != null) {
        _timer!.cancel();
        _timer = Timer(Duration(seconds: 0), () {});
      } else {
        _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
          drseconds = drseconds - 1;

          if (drseconds % 60 == 0) {
            print('startTimer function');
            setState(() {
              minutes = isMinutesZero ? minutes - 1 : minutes;
              dr = Duration(minutes: minutes);
              // drInTimeBody = Duration(minutes: minutes).toString().substring(0, 4);
              drInTimeBody = dr.inHours < 10 ? '0' : '';
              drInTimeBody = drInTimeBody +
                  dr.toString().substring(0, dr.inHours < 10 ? 4 : 5);
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
          if (drseconds == 1) {
            callBloc();
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPrayTimesBloc, GetPrayTimesState>(
        builder: (context, state) {
      return BlocBuilder<SwitchNotificationBloc, SwitchNotificationState>(
          builder: (context, state) {
        // if (state is SwitchLoadingState) {
        //   sound = false;
        //   return SizedBox();
        // } else
        if (state is SwitchLoadedState) {
          // setState(() {
          sound = state.soundOnOff![index];
          print('Sound is ' + sound.toString());
          // });
          return firstColumn(widget.maxW, state.soundOnOff![index]);
        } else {
          sound = false;
          return firstColumn(widget.maxW, sound);
        }
      });
    });
  }

  Widget firstColumn(double maxWidth, bool sound) {
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
              time(maxWidth, sound),
            ],
          ),
        )
      ],
    );
  }

  Widget time(double maxWidth, bool soundi) {
    // return BlocBuilder<SwitchNotificationBloc, SwitchNotificationState>(
    //     builder: (context, state) {
    //   if (state is SwitchLoadedState) {
    //     // setState(() {
    //     sound = state.soundOnOff![index];
    //     print('Sound is ' + sound.toString());
    //     // });
    //   }
    //   // bool sound = state is SwitchLoadedState
    //   //     ? state.soundOnOff![index]
    //   //     : soundOnOff[index];
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
      child: Column(
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
                  // value: turn,
                  // value: soundOnOff[index],
                  value: soundi,
                  onChanged: (val) {
                    print(
                        // 'turned from ${state is SwitchLoadedState ? state.soundOnOff![index] : soundOnOff[index]} to $val');
                        'turned from ${soundi} to $val');
                    // setState(() {
                    //   turn = !turn;
                    //   soundOnOff[index] = !soundOnOff[index];
                    // });
                    setState(() {
                      sound = !sound;
                    });
                    soundi
                        ? context
                            .read<SwitchNotificationBloc>()
                            .add(SwitchOffEvent(indexOfPrayTime: index))
                        : context
                            .read<SwitchNotificationBloc>()
                            .add(SwitchOnEvent(indexOfPrayTime: index));
                    ;
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
      ),
    );
    // });
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(bottom: 12.h),
            child: Image(
              image: AssetImage('assets/images/mosque_icon.png'),
              fit: BoxFit.contain,
            ),
          ),
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
      ),
    );
  }
}
