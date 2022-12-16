// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/data.dart';
import '../../models/today_pray_times_model.dart';
import 'alert_vremya.dart';
import 'switch_bloc/switch_notification_bloc.dart';

// List vremya = [
//   'Фаджр',
//   // 'Восход',
//   'Зухр',
//   'Аср',
//   'Магриб',
//   'Иша',
// ];
bool turn = true;
List<bool> sounds = [];

class SecondColumn extends StatefulWidget {
  const SecondColumn({
    super.key,
    required this.isLoaded,
    required this.maxW,
    this.tr,
  });
  final bool isLoaded;

  final double maxW;
  final TodayPrayTimesModel? tr;

  @override
  State<SecondColumn> createState() => _SecondColumnState();
}

class _SecondColumnState extends State<SecondColumn> {
  int indexNextTime = 6;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (widget.isLoaded) {
    // try {
    indexNextTime = widget.tr!.nextIndex;
    // } catch (e) {}
    // }
    context.read<SwitchNotificationBloc>().add(SwitchLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchNotificationBloc, SwitchNotificationState>(
        builder: (context, state) {
      if (state is SwitchLoadedState) {
        // setState(() {
        sounds = state.soundOnOff!;
        // });
        return secondColumn(widget.maxW, state.soundOnOff!);
      } else
        return Center(
          child: CircularProgressIndicator(color: blue),
        );
    });
  }

  Widget secondColumn(double maxWidth, List<bool> sounds) {
    return Column(
      children: [
        SizedBox(
          width: (maxWidth - 40 - 25) / 2,
          child: Image(
            image: AssetImage('assets/images/mosque_2.png'),
            fit: BoxFit.contain,
          ),
        ),
        Container(
          // margin: EdgeInsets.only(top: (maxWidth - 140) / 2),
          // margin: EdgeInsets.only(top: (maxWidth - 100) / 2),
          height: 370.h,
          width: (maxWidth - 40 - 25) / 2,

          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
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
          child:
              // widget.isLoaded
              //     ?
              Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              // vremya.length,
              5,
              (index) => vremya_tile(
                index,
                maxWidth,
                sounds[index],
              ),
            ),
          )
          // : Center(
          //     child: CircularProgressIndicator(color: blue),
          //   )
          ,
        )
      ],
    );
  }

  Widget vremya_tile(int i, double maxWidth, bool isSound) {
    return Container(
      // margin: ,
      width: (maxWidth - 40 - 12) / 2,
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              showGeneralDialog(
                context: context,
                pageBuilder: (((context, animation, secondaryAnimation) =>
                    AlertVremyaNamaz())),
              );
            },
            child: Text(
              nazvaniePrayTime[i],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: i != indexNextTime ? const Color(0xff011627) : blue,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // print(soundOnOff[i]);
              // setState(() {
              //   print('Sound on off');
              //   soundOnOff[i] = !soundOnOff[i];
              // });
              isSound
                  ? context
                      .read<SwitchNotificationBloc>()
                      .add(SwitchOffEvent(indexOfPrayTime: i))
                  : context
                      .read<SwitchNotificationBloc>()
                      .add(SwitchOnEvent(indexOfPrayTime: i));
              // print(soundOnOff[i]);
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  i == indexNextTime
                      ? sounds[i]
                          ? 'assets/images/sound_on_blue.png'
                          : 'assets/images/sound_off_blue.png'
                      : sounds[i]
                          ? 'assets/images/sound_on_black.png'
                          : 'assets/images/sound_off_black.png',
                ),
                fit: BoxFit.contain,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
