// import 'dart:html';

// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:ajua_namaz_1/constants/colors.dart';
import 'package:ajua_namaz_1/constants/textStyles.dart';
import 'package:ajua_namaz_1/models/today_pray_times_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/data.dart';
import '../fanjr/homeFanjr.dart';
import 'switch_bloc/switch_notification_bloc.dart';

// ignore_for_file: prefer_const_constructors
// showGeneralDialog(
//                 context: context,
//                 pageBuilder: (((context, animation, secondaryAnimation) =>
//                     AlertVremyaNamaz())),
//               );

// List nazvaniePrayTime = ['Фаджр', 'Восход', 'Зухр', 'Аср', 'Магриб', 'Иша'];
// List vremyaNamaz = ['06:08', '07:25', '12:39', '16:03', '17:46', '19:03'];
Map<String, dynamic>? vremyaNamaz;
List<bool> sounds = [];

class AlertStart extends StatefulWidget {
  const AlertStart({
    super.key,
    required this.tr,
  });
  final TodayPrayTimesModel tr;

  @override
  State<AlertStart> createState() => _AlertStartState();
}

class _AlertStartState extends State<AlertStart> {
  int indexNextTime = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vremyaNamaz = widget.tr.timesPerDay;
    indexNextTime = widget.tr.nextIndex;
    context.read<SwitchNotificationBloc>().add(SwitchLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<SwitchNotificationBloc, SwitchNotificationState>(
        builder: (context, state) {
      if (state is SwitchLoadedState) {
        // setState(() {
        sounds = state.soundOnOff!;
        // });
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide.none,
          ),
          insetPadding: const EdgeInsets.all(24),
          titlePadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          title: Container(
            width: MediaQuery.of(context).size.width - 40,
            // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topBody(context),
                SizedBox(height: 24),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    // nazvaniePrayTime.length,
                    5,
                    (index) => vremya_tile(index, maxWidth),
                  ),
                ),
              ],
            ),
          ),
        );
      } else
        return AlertDialog(
          content: Column(
            children: [
              topBody(context),
              SizedBox(height: 24),
              Center(
                child: CircularProgressIndicator(color: blue),
              ),
            ],
          ),
        );
    });
  }

  Row topBody(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Время намазов',
          style: ts11_20_600_08,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: greyc1,
            ),
            child: Icon(
              Icons.close,
              color: white,
            ),
          ),
        )
      ],
    );
  }

  Widget vremya_tile(int i, double maxWidth) {
    return Container(
      // margin: ,
      // width: (maxWidth - 40 - 12) / 2,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: InkWell(
        onTap: () {
          // here go to next page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => HomeFanjr()),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                nazvaniePrayTime[i],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  // color: i != 0 ? const Color(0xff011627) : blue,
                  color: i != indexNextTime ? const Color(0xff011627) : blue,
                ),
              ),
            ),
            Container(
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
            Expanded(
              child: Text(
                vremyaNamaz!['$i'],
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: i != indexNextTime ? const Color(0xff011627) : blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
