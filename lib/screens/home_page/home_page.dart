// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:ajua_namaz_1/constants/data.dart';
import 'package:ajua_namaz_1/constants/textStyles.dart';
import 'package:ajua_namaz_1/models/today_pray_times_model.dart';
import 'package:ajua_namaz_1/screens/compass/home_compass_page.dart';
import 'package:ajua_namaz_1/screens/home_page/alert_nachat.dart';
import 'package:ajua_namaz_1/screens/home_page/alert_vremya.dart';
import 'package:ajua_namaz_1/screens/home_page/carousel_clider.dart';
import 'package:ajua_namaz_1/screens/home_page/home_body.dart';
import 'package:ajua_namaz_1/screens/kuran/home_kuran.dart';
import 'package:ajua_namaz_1/screens/learn_namaz/home_learn_namaz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bottomNavBar.dart';
import '../../constants/colors.dart';
import '../tablitsa_for_month/home_tablitsa_for_month.dart';
import '../zikr/home_zikr_page.dart';
import 'bloc/get_pray_times_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextStyle ts = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xff333333),
);
// Color green = const Color(0xff00CF91);
// List vremya = ['Фаджр', 'Восход', 'Зухр', 'Аср', 'Магриб', 'Иша'];
bool turn = true;
BoxDecoration bd = BoxDecoration(
  borderRadius: BorderRadius.circular(13),
  color: white,
);
int year = DateTime.now().year;
int today = DateTime.now().day;
int month = DateTime.now().month;
int weekDay = DateTime.now().weekday;
bool isLoaded = false;
List<bool> soundOnOff = [false, true, false, true, false];

class _HomePageState extends State<HomePage> {
  void callBloc() {
    context.read<GetPrayTimesBloc>().add(GetPrayTimesLoadEvent());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callBloc();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<GetPrayTimesBloc, GetPrayTimesState>(
        builder: (context, state) {
      // if (state is GetPrayTimesLoading) {
      //   // setState(() {
      //   setState(() {
      //     isLoaded = false;
      //   });
      //   // });
      // }
      // if (state is GetPrayTimesLoaded) {
      //   // setState(() {
      //   isLoaded = true;
      //   // });
      // }
      return Scaffold(
        backgroundColor: whitef9,
        appBar: appBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: navButton(maxWidth, context),
        body: state is GetPrayTimesLoaded
            ? HomeBody(
                isLoaded: true,
                tr: state.tr,
                callBloc: callBloc,
              )
            : HomeBody(
                isLoaded: false,
                // tr: TodayPrayTimesModel(
                //   timesPerDay: {},
                //   nextIndex: 6,
                //   drToNextTime: Duration(seconds: 0),
                //   fajrTime: '24:00',
                // ),
                // callBloc: callBloc,
              ),
      );
    });
  }

  SafeArea navButton(double maxWidth, BuildContext context) {
    return SafeArea(
      child: Container(
        // height: 80,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        // color: Colors.yellow,
        child: Stack(
          children: [
            Positioned(
              bottom: 14,
              child: bottomNavBar(maxWidth),
            ),
            Positioned(
              bottom: 5,
              left: (MediaQuery.of(context).size.width - 72 - 40) / 2,
              child: InkWell(
                onTap: () {
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (((context, animation, secondaryAnimation) =>
                        AlertStart())),
                  );
                },
                child: Container(
                  // padding: EdgeInsets.only(bottom: 6),
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: black11,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Начать',
                    style: tsf4_14_400_08,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container bottomNavBar(double maxWidth) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        // color: Colors.green,
        color: white,
        borderRadius: BorderRadius.circular(25),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => HomeCompassPage()),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(
                  right: (maxWidth - 30 - 30 - 30) / 2, left: 12),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/compas_icon.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              print('Tapped Settings');
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(
                      maxWidth - 310,
                      // MediaQuery.of(context).size.height - 370,
                      0,
                      10,
                      40,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Spacer(),
                        popupMenuFirstBody(maxWidth),
                        cancelButton(context),
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: (maxWidth - 30 - 30 - 30 - 48) / 2, right: 12),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/settings_icon.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container cancelButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 50,
      decoration: bd,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          alignment: Alignment.center,
          child: Text(
            'Отмена',
            style: ts11_16_600_06,
          ),
        ),
      ),
    );
  }

  Divider dv = Divider(
    thickness: 1,
    color: grey87,
  );

  Container popupMenuFirstBody(double maxW) {
    return Container(
      // margin: EdgeInsets.fromLTRB(
      //     maxWidth - 100 - 20, 0, 20, 60),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      // width: 100,
      // height: 100,
      // color: Colors.green,
      decoration: bd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 5),
          zikrTile(maxW),
          dv,
          learnNamaz(maxW),
          dv,
          tablitsaTile(maxW),
          dv,
          prazdnikTile(maxW),
          dv,
          settingsTile(maxW),
          // Divider(
          //   thickness: 1,
          //   color: grey87,
          // ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  GestureDetector settingsTile(double maxW) {
    return GestureDetector(
      onTap: () {
        print('Tapped Настройки');
        // Navigator.of(context).pop();
      },
      child: Container(
        // color: Colors.yellow,
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: white,
                  radius: 13,
                  child: Icon(
                    Icons.settings,
                    color: blue,
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  'Настройки',
                  style: ts11_16_400_0,
                ),
              ],
            ),
            Container(
              width: 100,
              height: 25,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector prazdnikTile(double maxW) {
    return GestureDetector(
      onTap: () {
        print('Tapped Исламские праздники');
        // Navigator.of(context).pop();
      },
      child: Container(
        // color: Colors.yellow,
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: blue,
                  radius: 13,
                  child: Center(
                    child: Icon(
                      Icons.star_border_outlined,
                      size: 16,
                      color: white,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  'Исламские праздники',
                  style: ts11_16_400_0,
                ),
              ],
            ),
            // Container(
            //   width: 35,
            //   height: 25,
            //   color: Colors.white,
            // ),
          ],
        ),
      ),
    );
  }

  GestureDetector learnNamaz(double maxW) {
    return GestureDetector(
      onTap: () {
        print('Tapped Обучение намаза');
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => HomeLearnNamaz()),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: blue,
                  radius: 13,
                  child: Center(
                    // widthFactor: 20,
                    child: Text(
                      'H',
                      style: tsf4_10_600_05,
                    ),
                    // Icon(
                    //   Icons.calendar_month_outlined,
                    //   size: 16,
                    //   color: white,
                    // ),
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  'Обучение намаза',
                  style: ts11_16_400_0,
                ),
              ],
            ),
            // Container(
            //   width: 50,
            //   height: 25,
            //   color: Colors.white,
            // ),
          ],
        ),
      ),
    );
  }

  GestureDetector tablitsaTile(double maxW) {
    return GestureDetector(
      onTap: () {
        print('Tapped Таблица на месяц');
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TablitsaMonth(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: blue,
                  radius: 13,
                  child: Center(
                    // widthFactor: 20,
                    child: Icon(
                      Icons.calendar_month_outlined,
                      size: 16,
                      color: white,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  'Таблица на месяц',
                  style: ts11_16_400_0,
                ),
              ],
            ),
            // Container(
            //   width: 50,
            //   height: 25,
            //   color: Colors.white,
            // ),
          ],
        ),
      ),
    );
  }

  GestureDetector zikrTile(double maxW) {
    return GestureDetector(
      onTap: () {
        print('Tapped Zikr');
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeZikrPage(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: blue,
                  radius: 13,
                  child: Center(
                    child: Text(
                      '33',
                      style: tsf4_10_600_05,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  'Зикр',
                  style: ts11_16_400_0,
                ),
              ],
            ),
            Container(
              width: 150,
              height: 25,
              color: Colors.white,
            ),
            // Expanded(
            //   child: Container(
            //     width: double.infinity,
            //     height: 15,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      // toolbarHeight:,
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: const Color(0xffF9F9F9),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(weekDays[weekDay - 1], style: ts),
          Text('$today ${months[month - 1]}, $year', style: ts),
        ],
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => HomeKuran()),
              ),
            );
          },
          child: Container(
            width: 44,
            height: 44,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/Kuran.png'),
              fit: BoxFit.contain,
            )),
          ),
        ),
      ],
    );
  }
}
